package model.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.PostInformation;
/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * PostInformation 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class PostInformationDAO {
	private JDBCUtil jdbcUtil = null;

	public PostInformationDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}

	/**
	 * 사용자 관리 테이블에 새로운 사용자 생성.
	 */
	public PostInformation create(PostInformation post) throws SQLException {
		String sql = "INSERT INTO PostInformation VALUES (p0_seq.nextval,?,SYSDATE,?,?,?,?)";
		Object[] param = new Object[] {post.getPostTitle(), post.getPostContent(), post.getFileName(), post.getKind(), post.getLoginId() };
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil 에 insert문과 매개 변수 설정
		String key[] = {"postId"};	// PK 컬럼의 이름    
		try {
			jdbcUtil.executeUpdate(key); // insert 문 실행
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			if(rs.next()) {
				int generatedKey = rs.getInt(1);   // 생성된 PK 값
				post.setPostId(generatedKey); 	// id필드에 저장  
			}
			return post;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource 반환
		}
		return null;
	}

	/**
	 * 기존의 사용자 정보를 수정.
	 */
	public int update(PostInformation post) throws SQLException {
		String sql = "UPDATE PostInformation "
				+ "SET postTitle=?, postDate=SYSDATE, postContent=?, kind=? " + "WHERE postId=?";
		Object[] param = new Object[] { post.getPostTitle(), post.getPostContent(), post.getKind(), post.getPostId() };
		jdbcUtil.setSqlAndParameters(sql, param); // // JDBCUtil에 update문과 매개 변수 설정

		try {
			int result = jdbcUtil.executeUpdate(); // update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); //  resource 반환
		}
		return 0;
	}
	
	public int updateWithFile(PostInformation post) throws SQLException {
		String sql = "UPDATE PostInformation "
				+ "SET postTitle=?, postDate=SYSDATE, postContent=?, fileName=?, kind=? " + "WHERE postId=?";
		Object[] param = new Object[] { post.getPostTitle(), post.getPostContent(), post.getFileName(), post.getKind(), post.getPostId() };
		jdbcUtil.setSqlAndParameters(sql, param); // // JDBCUtil에 update문과 매개 변수 설정

		try {
			int result = jdbcUtil.executeUpdate(); // update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); //  resource 반환
		}
		return 0;
	}

	public int remove(int postId) throws SQLException {
		String sql = "DELETE FROM PostInformation WHERE postId=? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { postId }); // JDBCUtil에 delete문과 매개 변수 설정

		try {
			int result = jdbcUtil.executeUpdate(); // delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource 반환
		}
		return 0;
	}

	public PostInformation findPost(int postId) throws SQLException {
		String sql = "SELECT * "+ "FROM PostInformation "+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	
		PostInformation post = null;// JDBCUtil에 query문과 매개 변수 설정
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				post = new PostInformation(		// Community 객체를 생성하여 커뮤니티 정보를 저장
						postId,
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("fileName"),
						rs.getString("kind"),
						rs.getString("loginId"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();		// resource 반환
		}
		return post;
	}


	public List<PostInformation> searchP0List(String word, Date start, Date end) throws SQLException {
		String sql = "SELECT * "+ "FROM PostInformation "+"where (postTitle like ? or postContent like ?) and (postDate between ?-1 and ?+1) ";
			jdbcUtil.setSqlAndParameters(sql, new Object[] {word, word, new java.sql.Date(start.getTime()), new java.sql.Date(end.getTime())});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query 실행
			ArrayList<PostInformation> InformationList = new ArrayList<PostInformation>();// post들의 리스트 생성
			while(rs.next()) {
				PostInformation post = new PostInformation(         // PostInformation 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("fileName"),
						rs.getString("kind"),
						rs.getString("loginId"));
				InformationList.add(post);
			}
			return InformationList;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource 반환
		}
		return null;
	}

	public List<PostInformation> findP0List() throws SQLException {
		String sql = "SELECT * "+ "FROM PostInformation ";

		jdbcUtil.setSqlAndParameters(sql, null);      // JDBCUtil에 query문 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
			List<PostInformation> InformationList = new ArrayList<PostInformation>();   // PostInformation들의 리스트 생성
			while (rs.next()) {
				PostInformation post = new PostInformation(         // PostInformation 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("fileName"),
						rs.getString("kind"),
						rs.getString("loginId"));
				InformationList.add(post);            // List에 PostInformation 객체 저장
			}      
			return InformationList;               

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();      // resource 반환
		}
		return null;
	}
	
	public List<PostInformation> findP0WithUser(String loginId) throws SQLException {
		String sql = "SELECT * "+ "FROM PostInformation "+ "WHERE loginId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {loginId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
			List<PostInformation> InformationList = new ArrayList<PostInformation>();   // PostInformation들의 리스트 생성
			while (rs.next()) {
				PostInformation post = new PostInformation(         // PostInformation 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("fileName"),
						rs.getString("kind"),
						loginId);
				InformationList.add(post);            // List에 PostInformation 객체 저장
			}      
			return InformationList;               

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();      // resource 반환
		}
		return null;
	}

	public String findPostTitle(int postId) throws SQLException {
		String sql = "SELECT POSTTITLE "+ "FROM PostInformation "+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	
		String postTitle = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs.next()) {
				postTitle = rs.getString("postTitle");// query 실행
			}
			return postTitle;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}


}
