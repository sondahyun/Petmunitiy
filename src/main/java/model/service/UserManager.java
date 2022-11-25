package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Community;
import model.PostAdoption;
import model.PostInformation;
import model.UserInfo;
import model.dao.PostAdoptionDAO;
import model.dao.PostInformationDAO;
import model.dao.UserDAO;

/**
 * ����� ���� API�� ����ϴ� �����ڵ��� ���� �����ϰ� �Ǵ� Ŭ����.
 * UserDAO�� �̿��Ͽ� �����ͺ��̽��� ������ ���� �۾��� �����ϵ��� �ϸ�,
 * �����ͺ��̽��� �����͵��� �̿��Ͽ� �����Ͻ� ������ �����ϴ� ������ �Ѵ�.
 * �����Ͻ� ������ ������ ��쿡�� �����Ͻ� �������� �����ϴ� Ŭ������ 
 * ������ �� �� �ִ�.
 */
public class UserManager {
	private static UserManager userMan = new UserManager();
	private UserDAO userDAO;
	
	private UserManager() {
		try {
			userDAO = new UserDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static UserManager getInstance() {
		return userMan;
	}
	
	public int create(UserInfo user) throws SQLException, ExistingUserException {
		if (userDAO.existingUser(user.getLoginId()) == true) {
			throw new ExistingUserException(user.getUserId() + "는 존재하는 아이디 입니다.");
		}
		return userDAO.create(user);
	}

	public int update(UserInfo user) throws SQLException, UserNotFoundException {
		return userDAO.update(user);
	}	

	public int remove(String loginId) throws SQLException, UserNotFoundException {
		return userDAO.remove(loginId);
	}

	public boolean login(String loginId, String password)
		throws SQLException, UserNotFoundException, PasswordMismatchException {
		UserInfo user = userDAO.findUser(loginId);

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
		}
		return true;
	}

	public UserInfo findUser(String loginId) throws SQLException {
		return userDAO.findUser(loginId);
	}
	public UserDAO getUserDAO() {
		return this.userDAO;
	}
	public PostInformation createPostInformation(PostInformation post) throws SQLException {
	      return PostInformationDAO.create(post);      
	   }

	   public int updateCommunity(PostInformation post) throws SQLException {
	      return PostInformationDAO.update(post);            
	   }
	
	
	//adoptiondao
	public int createP0Adoption(PostAdoption comm) throws SQLException {
		return PostAdoptionDAO.create(comm);	
	}
	
}
