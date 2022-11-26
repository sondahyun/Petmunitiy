package model.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

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
	private PostInformationDAO postInformationDAO;
	private PostAdoptionDAO postAdoptionDAO;
	private UserManager() {
		try {
			userDAO = new UserDAO();
			postInformationDAO = new PostInformationDAO();
			postAdoptionDAO = new PostAdoptionDAO();
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
		return postInformationDAO.create(post);      
	}

	public int updatePostInformation(PostInformation post) throws SQLException {
		return postInformationDAO.update(post);            
	}
	
	public int removePostInformation(int postId) throws SQLException{
		return postInformationDAO.remove(postId);
	}
	
	public PostInformation findInformationPost(int postId) throws SQLException {
		return postInformationDAO.findPost(postId); 
	}
	
	public List<PostInformation> searchP0List(String postTitle, Date start, Date end) throws SQLException {
		return postInformationDAO.searchP0List(postTitle, start, end);
	}
	
	public List<PostInformation> findP0List() throws SQLException {
		return postInformationDAO.findP0List();
	}

	//adoptiondao
	public int createP3Adoption(PostAdoption post) throws SQLException {
		return postAdoptionDAO.create(post);	
	}
	
	public int updateP3Adoption(PostAdoption post) throws SQLException {
		return postAdoptionDAO.update(post);
	}
	
	public PostAdoption findP3Adoption(int postId) throws SQLException {
		PostAdoption post = postAdoptionDAO.findPost(postId); 
		
		return post;
	}
	
	public List<PostAdoption> findP3List() throws SQLException {
		return postAdoptionDAO.findP3List();
	}

}
