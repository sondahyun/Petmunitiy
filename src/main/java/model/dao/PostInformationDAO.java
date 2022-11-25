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
	public PostInformation create(PostInformation post) throws SQLException {
		String sql = "INSERT INTO PostInformation VALUES (p0_seq.nextval,?,?,?,?,?,?)";
		Object[] param = new Object[] {post.getPostTitle(), new java.sql.Date(post.getPostDate().getTime()), post.getPostContent(), post.getFileName(), post.getKind(), post.getLoginId() };
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
				post.setLoginId(rs.getString("loginId"));
				
				return post;
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource 반환
		}
		return null;
	}


	
}
