package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.PostInformation;
import model.Pet;
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
	public int create(PostInformation post) throws SQLException {
		String sql = "INSERT INTO PostInformation VALUES (Sequence_auto.nextval,?,?,?,?,?,?)";
		Object[] param = new Object[] { post.getPostTitle(), post.getPostDate(), post.getPostContent(), post.getFileName(), post.getKind(), post.getUserId() };
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil 에 insert문과 매개 변수 설정

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
	public int update(PostInformation post) throws SQLException {
		String sql = "UPDATE PostInformation "
				+ "SET postTitle=?, postDate=?, postContent=?, fileName=?, kind=?" + "WHERE postId=?";
		Object[] param = new Object[] { post.getPostTitle(), post.getPostDate(), post.getPostContent(), post.getFileName(), post.getKind(), post.getPostId() };
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

	/**
	 * 사용자 ID에 해당하는 사용자를 삭제.
	 */
	public int remove(String loginId) throws SQLException {
		String sql = "DELETE FROM PostInformation WHERE loginId=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { loginId }); // JDBCUtil에 delete문과 매개 변수 설정

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

	@SuppressWarnings("unchecked")
	public PostInformation findPost(String loginId) throws SQLException {
		String sql = "SELECT * " + "FROM PostInformation " + "WHERE loginId=? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { loginId }); // JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query 실행
			PostInformation post = null;
			ArrayList<Integer> list = new ArrayList<>();// post들의 리스트 생성
			if(rs.next()) {// 학생 정보 발견
				post = new PostInformation();// post 객체를 생성하여 정보를 저장
				
				post.setPostTitle(rs.getString("postTitle"));
				post.setPostDate(rs.getDate("postDate"));
				post.setPostContent(rs.getString("postContent"));
				post.setFileName(rs.getString("fileName"));
				post.setKind(rs.getString("kind"));
				post.setUserId(rs.getInt("userId"));
				
				return post;
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource 반환
		}
		return null;
	}
	
	/**
	 * 주어진  ID에 해당하는 커뮤니티 정보를 데이터베이스에서 찾아 PostInformation 도메인 클래스에 
	 * 저장하여 반환.
	 */
	public PostInformation findPostInformation(int postId) throws SQLException {
        String sql = "SELECT postTitle, postDate, loginId "
        			+ "FROM PostInformation pi LEFT OUTER JOIN UserInfo u ON pi.userId = u.userId "
        			+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	// JDBCUtil에 query문과 매개 변수 설정
		PostInformation postInformation = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			if (rs.next()) {						// 학생 정보 발견
				postInformation = new PostInformation(		// PostInformation 객체를 생성하여 커뮤니티 정보를 저장
					postId,
					rs.getString("postTitle"),
					rs.getDate("postDate"),
					rs.getString("postContent"),
					rs.getString("fileName"),
					rs.getString("kind"),
					rs.getInt("userId"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return postInformation;
	}

	/**
	 * 전체 커뮤니티 정보를 검색하여 List에 저장 및 반환
	 */
	public List<PostInformation> findPostInformationList() throws SQLException {
        String sql = "SELECT postTitle, postDate, loginId "
        		   + "FROM PostInformation pi LEFT OUTER JOIN UserInfo u ON pi.userId = u.userId ";
        
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<PostInformation> informationList = new ArrayList<PostInformation>();	// PostInformation들의 리스트 생성
			while (rs.next()) {
				PostInformation comm = new PostInformation(			// PostInformation 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getString("postContent"),
						rs.getString("fileName"),
						rs.getString("kind"),
						rs.getInt("userId"));
				informationList.add(comm);				// List에 PostInformation 객체 저장
			}		
			return informationList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
}
