package model.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.PostGroup;
import model.PostInformation;
/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * PostInformation 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class PostGroupDAO {
	private JDBCUtil jdbcUtil = null;

	public PostGroupDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}

	/**
	 * 사용자 관리 테이블에 새로운 사용자 생성.
	 */
	public PostGroup create(PostGroup post) throws SQLException {
		String sql = "INSERT INTO PostGroup VALUES (p1_seq.nextval,?,SYSDATE,?,?,?,?,?,?)";
		Object[] param = new Object[] {post.getPostTitle(), post.getPostContent(), post.getGroupPurpose(), post.getRegion(), 
										post.getHeadCount(), post.getFileName(), post.getLoginId() };
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
	public int update(PostGroup post) throws SQLException {
		String sql = "UPDATE PostGroup "
				+ "SET postTitle=?, postDate=SYSDATE, postContent=?, groupPurpose=?, region=? " + "WHERE postId=?";
		Object[] param = new Object[] { post.getPostTitle(), post.getPostContent(), post.getGroupPurpose(), 
										post.getRegion(), post.getPostId() };
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
	
	public int updateWithFile(PostGroup post) throws SQLException {
		String sql = "UPDATE PostGroup "
				+ "SET postTitle=?, postDate=SYSDATE, postContent=?, groupPurpose=?, region=?, fileName=? " + "WHERE postId=?";
		Object[] param = new Object[] { post.getPostTitle(), post.getPostContent(), post.getGroupPurpose(), 
										post.getRegion(), post.getFileName(), post.getPostId() };
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
		String sql = "DELETE FROM PostGroup WHERE postId=? ";
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

	public PostGroup findPost(int postId) throws SQLException {
		String sql = "SELECT * "+ "FROM PostGroup "+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	
		PostGroup post = null;// JDBCUtil에 query문과 매개 변수 설정
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				post = new PostGroup(		// Community 객체를 생성하여 커뮤니티 정보를 저장
						postId,
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("groupPurpose"),
						rs.getString("region"),
						rs.getInt("headCount"),
						rs.getString("fileName"),
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


	public List<PostGroup> searchP1List(String word, Date start, Date end) throws SQLException {
		String sql = "SELECT * "+ "FROM PostGroup "+"where (postTitle like ? or postContent like ?) and (postDate between ? and ?) ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {word, word, new java.sql.Date(start.getTime()), new java.sql.Date(end.getTime())});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query 실행
			ArrayList<PostGroup> groupList = new ArrayList<PostGroup>();// post들의 리스트 생성
			while(rs.next()) {// 학생 정보 발견
				PostGroup post = new PostGroup();// post 객체를 생성하여 정보를 저장
				post.setPostTitle(rs.getString("postTitle"));
				post.setPostDate(rs.getDate("postDate"));
				post.setPostContent(rs.getString("postContent"));
				post.setGroupPurpose(rs.getString("groupPurpose"));
				post.setRegion(rs.getString("region"));
				post.setHeadCount(rs.getInt("headCount"));
				post.setFileName(rs.getString("fileName"));
				post.setLoginId(rs.getString("loginId"));
				groupList.add(post);
			}
			return groupList;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource 반환
		}
		return null;
	}

	public List<PostGroup> findP1List() throws SQLException {
		String sql = "SELECT * "+ "FROM PostGroup ";

		jdbcUtil.setSqlAndParameters(sql, null);      // JDBCUtil에 query문 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
			List<PostGroup> groupList = new ArrayList<PostGroup>();   // PostInformation들의 리스트 생성
			while (rs.next()) {
				PostGroup post = new PostGroup(         // PostInformation 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("groupPurpose"),
						rs.getString("region"),
						rs.getInt("headCount"),
						rs.getString("fileName"),
						rs.getString("loginId"));
				groupList.add(post);            // List에 PostInformation 객체 저장
			}      
			return groupList;               

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();      // resource 반환
		}
		return null;
	}
	
	public List<PostGroup> findP1WithUser(String loginId) throws SQLException {
		String sql = "SELECT * "+ "FROM PostGroup "+ "WHERE loginId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {loginId});

		try {
			ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
			List<PostGroup> groupList = new ArrayList<PostGroup>();   // PostInformation들의 리스트 생성
			while (rs.next()) {
				PostGroup post = new PostGroup(         // PostInformation 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("groupPurpose"),
						rs.getString("region"),
						rs.getInt("headCount"),
						rs.getString("fileName"),
						loginId);
				groupList.add(post);            // List에 PostInformation 객체 저장
			}      
			return groupList;               

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();      // resource 반환
		}
		return null;
	}
	
	public String findPostTitle(int postId) throws SQLException {
		String sql = "SELECT POSTTITLE "+ "FROM PostGroup "+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	
		String postTitle = null;// JDBCUtil에 query문과 매개 변수 설정
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				rs.getString("postTitle");
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
	
	public int joinButtonClick(int headCount, int postId)throws SQLException {
		String sql = "UPDATE PostGroup "+ "SET headCount=? " + "WHERE postId=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {headCount, postId});	
		
		try {
			int result = jdbcUtil.executeUpdate();		// query 실행
			return result;

	} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();		// resource 반환
		}
		return 0;
	}
}
