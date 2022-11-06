package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.UserList;

/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * USERINFO 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class UserDAO {
	private JDBCUtil jdbcUtil = null;
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
		
	/**
	 * 사용자 관리 테이블에 새로운 사용자 생성.
	 */
	public int create(UserList user) throws SQLException {
		String sql = "INSERT INTO USERLIST VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {user.getUserId(), user.getLoginId(), user.getLoginPwd(),
						user.getUserNickname(), user.getUserBirth(), user.getPhoneNumber(), 
						user.getGender(), user.getAddress(), user.getPetList()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정
						
		try {				
			int result = jdbcUtil.executeUpdate();	// insert 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;			
	}

	/**
	 * 기존의 사용자 정보를 수정.
	 */
	public int update(UserList user) throws SQLException {
		String sql = "UPDATE USERLIST "
					+ "SET loginPwd=?, userNickname=?, userBirth=?, phoneNumber=?, address=?, petList=?"
					+ "WHERE userId=?";
		Object[] param = new Object[] {user.getLoginPwd(), user.getUserNickname(), 
					user.getUserBirth(), user.getPhoneNumber(), 
					user.getAddress(), user.getPetList(),
					user.getUserId()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}

	/**
	 * 사용자 ID에 해당하는 사용자를 삭제.
	 */
	public int remove(String loginId) throws SQLException {
		String sql = "DELETE FROM USERLIST WHERE loginId=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {loginId});	// JDBCUtil에 delete문과 매개 변수 설정

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
	
	public UserList findUser(String loginId) throws SQLException {
        String sql = "SELECT * "
                 + "FROM USERLIST"
                 + "WHERE loginId=? ";              
      jdbcUtil.setSqlAndParameters(sql, new Object[] {loginId});   // JDBCUtil 뿉 query臾멸낵 留ㅺ컻 蹂  닔  꽕 젙

      try {
         ResultSet rs = jdbcUtil.executeQuery();      // query  떎 뻾
         if (rs.next()) {                  //  븰 깮  젙蹂  諛쒓껄
            UserList user = new UserList(      // User 媛앹껜瑜   깮 꽦 븯 뿬  븰 깮  젙蹂대      옣
               rs.getInt("userId"),
               rs.getString("loginId"),
               rs.getString("loginPwd"),
               rs.getString("userNickname"),
               rs.getDate("userBirth"),
               rs.getString("phoneNumber"),
               rs.getString("gender"),               
               rs.getString("address"),
               rs.getInt("petList"));//dao 수정
            return user;
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource 諛섑솚
      }
      return null;
   }
	
	/**
	 * 주어진 사용자 ID에 해당하는 사용자가 존재하는지 검사 
	 */
	public boolean existingUser(String loginId) throws SQLException {
		String sql = "SELECT count(*) FROM USERLIST WHERE loginId=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {loginId});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return false;
	}

}
