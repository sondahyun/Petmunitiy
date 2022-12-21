package model.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.PostPetstargram;
/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * PostPetstargram 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class PostPetstargramDAO {
	private JDBCUtil jdbcUtil = null;

	public PostPetstargramDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}

	/**
	 * 사용자 관리 테이블에 새로운 사용자 생성.
	 */
	public int create(PostPetstargram post) throws SQLException {
		String sql = "INSERT INTO PostPetstargram VALUES (p2_seq.nextval,?,SYSDATE,?,?,?,?)";
		Object[] param = new Object[] {post.getPostTitle(), post.getPostContent(), post.getFileName(), post.getKind(), post.getLoginId() };
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil 에 insert문과 매개 변수 설정
		String key[] = {"postId"};	// PK 컬럼의 이름    
		try {
			int result = jdbcUtil.executeUpdate(); // insert 문 실행
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

	/**
	 * 기존의 사용자 정보를 수정.
	 */
	public int update(PostPetstargram post) throws SQLException {
		String sql = "UPDATE PostPetstargram "
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
	
	public int updateWithFile(PostPetstargram post) throws SQLException {
		String sql = "UPDATE PostPetstargram "
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
		String sql = "DELETE FROM PostPetstargram WHERE postId=? ";
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

	public PostPetstargram findPost(int postId) throws SQLException {
		String sql = "SELECT * "+ "FROM PostPetstargram "+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	
		PostPetstargram post = null;// JDBCUtil에 query문과 매개 변수 설정
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				post = new PostPetstargram(		// Community 객체를 생성하여 커뮤니티 정보를 저장
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


	public List<PostPetstargram> searchP2List(String postTitle, Date start, Date end) throws SQLException {
		String sql = "SELECT * " + "FROM PostPetstargram " + "WHERE POSTTITLE LIKE %?% AND POSTDATE BETWEEN ? AND ? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { postTitle, new java.sql.Date(start.getTime()), new java.sql.Date(end.getTime()) }); // JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query 실행
			ArrayList<PostPetstargram> PetstargramList = new ArrayList<PostPetstargram>();// post들의 리스트 생성
			while(rs.next()) {// 학생 정보 발견
				PostPetstargram post = new PostPetstargram();// post 객체를 생성하여 정보를 저장
				post.setPostTitle(rs.getString("postTitle"));
				post.setPostDate(rs.getDate("postDate"));
				post.setPostContent(rs.getString("postContent"));
				post.setFileName(rs.getString("fileName"));
				post.setKind(rs.getString("kind"));
				post.setLoginId(rs.getString("loginId"));
				PetstargramList.add(post);
			}
			return PetstargramList;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource 반환
		}
		return null;
	}

	public List<PostPetstargram> findP2List() throws SQLException {
		String sql = "SELECT * "+ "FROM PostPetstargram ";

		jdbcUtil.setSqlAndParameters(sql, null);      // JDBCUtil에 query문 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
			List<PostPetstargram> PetstargramList = new ArrayList<PostPetstargram>();   // PostPetstargram들의 리스트 생성
			while (rs.next()) {
				PostPetstargram post = new PostPetstargram(         // PostPetstargram 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("fileName"),
						rs.getString("kind"),
						rs.getString("loginId"));
				PetstargramList.add(post);            // List에 PostPetstargram 객체 저장
			}      
			return PetstargramList;               

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();      // resource 반환
		}
		return null;
	}
	
	public List<PostPetstargram> findP2WithUser(String loginId) throws SQLException {
		String sql = "SELECT * "+ "FROM PostPetstargram "+ "WHERE loginId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {loginId});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
			List<PostPetstargram> petstarList = new ArrayList<PostPetstargram>();   // PostPetstargram들의 리스트 생성
			while (rs.next()) {
				PostPetstargram post = new PostPetstargram(         // PostPetstargram 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("fileName"),
						rs.getString("kind"),
						loginId);
				petstarList.add(post);            // List에 PostPetstargram 객체 저장
			}      
			return petstarList;               

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();      // resource 반환
		}
		return null;
	}

	public String findPostTitle(int postId) throws SQLException {
		String sql = "SELECT POSTTITLE "+ "FROM PostPetstargram "+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	
		String postTitle = null;// JDBCUtil에 query문과 매개 변수 설정
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				postTitle =rs.getString("postTitle");
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
