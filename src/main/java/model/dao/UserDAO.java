package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.UserInfo;

/**
 * ����� ������ ���� �����ͺ��̽� �۾��� �����ϴ� DAO Ŭ���� USERINFO ���̺� �����
 * ������ �߰�, ����, ����, �˻� ����
 */
public class UserDAO {
	private JDBCUtil jdbcUtil = null;

	public UserDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil ��ü ����
	}

	/**
	 * ����� ���� ���̺� ���ο� ����� ����.
	 */
	public int create(UserInfo user) throws SQLException {
		String sql = "INSERT INTO UserInfo VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] { user.getUserId(), user.getLoginId(), user.getLoginPwd(), user.getUserNickname(),
				user.getUserBirth(), user.getPhoneNumber(), user.getGender(), user.getAddress(), user.getPetList() };
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil �� insert���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate(); // insert �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource ��ȯ
		}
		return 0;
	}

	/**
	 * ������ ����� ������ ����.
	 */
	public int update(UserInfo user) throws SQLException {
		String sql = "UPDATE UserInfo "
				+ "SET loginPwd=?, userNickname=?, userBirth=?, phoneNumber=?, address=?, petList=?" + "WHERE userId=?";
		Object[] param = new Object[] { user.getLoginPwd(), user.getUserNickname(), user.getUserBirth(),
				user.getPhoneNumber(), user.getAddress(), user.getPetList(), user.getUserId() };
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil�� update���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate(); // update �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource ��ȯ
		}
		return 0;
	}

	/**
	 * ����� ID�� �ش��ϴ� ����ڸ� ����.
	 */
	public int remove(String loginId) throws SQLException {
		String sql = "DELETE FROM UserInfo WHERE loginId=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { loginId }); // JDBCUtil�� delete���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate(); // delete �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource ��ȯ
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	public UserInfo findUser(String loginId) throws SQLException {
		String sql = "SELECT * " + "FROM UserInfo" + "WHERE loginId=? ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { loginId }); // JDBCUtil �� query문과 ׺�개 � �� �� ��

		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query �� ��
			UserInfo user = null;
			ArrayList<Integer> list = new ArrayList<>();
			if(rs.next()) {
				user = new UserInfo();
				user.setUserId(rs.getInt("userId"));
				user.setLoginId(rs.getString("loginId"));
				user.setLoginPwd(rs.getString("loginPwd"));
				user.setUserNickname(rs.getString("userNickname"));
				user.setUserBirth(rs.getDate("userBirth"));
				user.setPhoneNumber(rs.getString("phoneNumber"));
				user.setGender(rs.getString("gender"));
				user.setAddress(rs.getString("address"));
				user.setPetList((ArrayList<Integer>) rs.getArray("petList"));
				
				return user;
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource 반환
		}
		return null;
	}

	/**
	 * �־��� ����� ID�� �ش��ϴ� ����ڰ� �����ϴ��� �˻�
	 */
	public boolean existingUser(String loginId) throws SQLException {
		String sql = "SELECT count(*) FROM UserInfo WHERE loginId=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { loginId }); // JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query ����
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource ��ȯ
		}
		return false;
	}

}
