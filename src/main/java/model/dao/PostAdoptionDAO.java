package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Pet;
import model.PostAdoption;


/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * PostInformation 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class PostAdoptionDAO {
	private JDBCUtil jdbcUtil = null;

	public PostAdoptionDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}

	/**
	 * 사용자 관리 테이블에 새로운 사용자 생성.
	 */
	public int create(PostAdoption post) throws SQLException {
		String sql = "INSERT INTO PostAdoption VALUES (p3_seq.nextval,?,?,?,?,?,?,?)";
		Object[] param = new Object[] { post.getPostTitle(), new java.sql.Date(post.getPostDate().getTime()), post.getType(), post.getApproval(), new java.sql.Date(post.getApprovalDate().getTime()), post.getLoginId(), post.getPostContent() };
		
		
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
	public int update(PostAdoption post) throws SQLException {
		String sql = "UPDATE PostAdotpion "
				+ "SET postTitle=?, postDate=?, type=?, approval=?, approvaldate=?, userid=?, postcontent=? " + "WHERE postId=?";
		Object[] param = new Object[] { post.getPostTitle(), post.getPostDate(), post.getType(), post.getApproval(), post.getApprovalDate(), post.getLoginId(),post.getPostContent(), post.getPostId() };
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
		String sql = "DELETE FROM PostAdoption WHERE loginId=?";
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
	public PostAdoption findPost(String loginId) throws SQLException {
		String sql = "SELECT * " + "FROM PostInformation " + "WHERE loginId=? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { loginId }); // JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query 실행
			PostAdoption post = null;
			ArrayList<Integer> list = new ArrayList<>();// post들의 리스트 생성
			if(rs.next()) {// 학생 정보 발견
				post = new PostAdoption();// post 객체를 생성하여 정보를 저장
				
				post.setPostTitle(rs.getString("postTitle"));
				post.setPostDate(rs.getDate("postDate"));
				post.setType(rs.getInt("type"));
				post.setApproval(rs.getInt("approval"));
				post.setApprovalDate(rs.getDate("approvalDate"));
				post.setLoginId(rs.getString("loginId"));
				post.setPostContent(rs.getString("postContent"));
				
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
	public PostAdoption findPostAdoption(int postId) throws SQLException {
        String sql = "SELECT postTitle, postDate, loginId "
        			+ "FROM PostAdoption pi LEFT OUTER JOIN UserInfo u ON pi.userId = u.userId "
        			+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	// JDBCUtil에 query문과 매개 변수 설정
		PostAdoption postAdoption = null;
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			if (rs.next()) {						// 학생 정보 발견
				postAdoption = new PostAdoption(		// PostInformation 객체를 생성하여 커뮤니티 정보를 저장
					rs.getString("postTitle"),
					rs.getDate("postDate"),
					rs.getInt("type"),
					rs.getInt("approval"),
					rs.getDate("approvalDate"),
					rs.getString("loginId"),
					rs.getString("postContent"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return postAdoption;
	}

	/**
	 * 전체 커뮤니티 정보를 검색하여 List에 저장 및 반환
	 */
	public List<PostAdoption> findPostInformationList() throws SQLException {
        String sql = "SELECT postTitle, postDate, loginId "
        		   + "FROM PostInformation pi LEFT OUTER JOIN UserInfo u ON pi.userId = u.userId ";
        
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<PostAdoption> adoptionList = new ArrayList<PostAdoption>();	// PostInformation들의 리스트 생성
			while (rs.next()) {
				PostAdoption pAdoption = new PostAdoption(			// PostInformation 객체를 생성하여 현재 행의 정보를 저장
						rs.getString("postTitle"),
						rs.getDate("postDate"),
						rs.getInt("type"),
						rs.getInt("approval"),
						rs.getDate("approvalDate"),
						rs.getString("loginId"),
						rs.getString("postContent"));
				adoptionList.add(pAdoption);				// List에 PostInformation 객체 저장
			}		
			return adoptionList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
}
