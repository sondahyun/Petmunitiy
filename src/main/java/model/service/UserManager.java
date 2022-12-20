package model.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.*;
import model.dao.*;

public class UserManager {
	private static final Logger log = LoggerFactory.getLogger(PostAdoption.class);
    
	private static UserManager userMan = new UserManager();
	private UserDAO userDAO;
	private PetDAO petDAO;
	private PostAdoptionDAO postAdoptionDAO;
	private PostGroupDAO postGroupDAO;
	private PostPetstargramDAO postPetstargramDAO;
	private PostInformationDAO postInformationDAO;
	private CommentP0DAO commentP0DAO;
	private CommentP1DAO commentP1DAO;
	private CommentP2DAO commentP2DAO;
	private CommentP3DAO commentP3DAO;
	private ApplyDAO applyDAO;

	private UserManager() {
		try {
			userDAO = new UserDAO();
			petDAO = new PetDAO();
			postInformationDAO = new PostInformationDAO();
			commentP0DAO = new CommentP0DAO();
			postGroupDAO = new PostGroupDAO();
			commentP1DAO = new CommentP1DAO();
			postPetstargramDAO = new PostPetstargramDAO();
			commentP2DAO = new CommentP2DAO();
			postAdoptionDAO = new PostAdoptionDAO();
			commentP3DAO = new CommentP3DAO();
			applyDAO = new ApplyDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	public static UserManager getInstance() {
		return userMan;
	}
	
	//userinfo
	public int create(UserInfo user) throws SQLException, ExistingUserException {
		if (userDAO.existingUser(user.getLoginId()) == true) {
			throw new ExistingUserException(user.getLoginId() + "는 존재하는 아이디 입니다.");
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
	
	public int findUserId(String loginId) throws SQLException{
		return userDAO.findUserId(loginId);
	}
	
	//pet

	//pet
	public int createPet(Pet pet) throws SQLException {
		return petDAO.create(pet);      
	}
	
	public int updatePet(Pet pet) throws SQLException {
		return petDAO.update(pet);            
	}
	
	public int removePet(int petId) throws SQLException{
		return petDAO.remove(petId);
	}
	
	public Pet findPet(String loginId) throws SQLException {
		return petDAO.findPet(loginId); 
	}
	public List<Pet> findPetList() throws SQLException {
		return petDAO.findPetList();
	}
	
	//information community
	public PostInformation createPostInformation(PostInformation post) throws SQLException {
		return postInformationDAO.create(post);      
	}

	public int updatePostInformation(PostInformation post) throws SQLException {
		return postInformationDAO.update(post);            
	}
	
	public int removePostInformation(int postId) throws SQLException{
		return postInformationDAO.remove(postId);
	}
	
	public PostInformation findP0Information(int postId) throws SQLException {
		return postInformationDAO.findPost(postId); 
	}
	
	public List<PostInformation> searchP0List(String postTitle, Date start, Date end) throws SQLException {
		return postInformationDAO.searchP0List(postTitle, start, end);
	}
	
	public List<PostInformation> findP0List() throws SQLException {
		return postInformationDAO.findP0List();
	}
	
	public List<PostInformation> findP0WithUser(String loginId) throws SQLException {
		return postInformationDAO.findP0WithUser(loginId);
	}
	
	public String findP0Title(int postId) throws SQLException {
		return postInformationDAO.findPostTitle(postId); 
	}
	
	//c0
	public int createC0(CommentInformation ci) throws SQLException {
		return commentP0DAO.create(ci);
	}
	
	public int updateC0(CommentInformation ci) throws SQLException {
		return commentP0DAO.update(ci);
	}
	
	public int removeC0(int commentId) throws SQLException {
		return commentP0DAO.remove(commentId);
	}
	
	public CommentInformation findC0(int commentId) throws SQLException{
		return commentP0DAO.findC0(commentId);
	}
	public List<CommentInformation> findC0List() throws SQLException {
		return commentP0DAO.findC0List();
	}
	
	public List<CommentInformation> findC0WithUser(int userId) throws SQLException {
		return commentP0DAO.findC0WithUser(userId);
	}
	
	//group community
	public PostGroup createPostGroup(PostGroup post) throws SQLException {
		return postGroupDAO.create(post);      
	}

	public int updatePostGroup(PostGroup post) throws SQLException {
		return postGroupDAO.update(post);            
	}
	
	public int removePostGroup(int postId) throws SQLException{
		return postGroupDAO.remove(postId);
	}
	
	public PostGroup findP1Group(int postId) throws SQLException {
		return postGroupDAO.findPost(postId); 
	}
	
	public List<PostGroup> searchP1List(String postTitle, Date start, Date end) throws SQLException {
		return postGroupDAO.searchP1List(postTitle, start, end);
	}
	
	public List<PostGroup> findP1List() throws SQLException {
		return postGroupDAO.findP1List();
	}
	
	public List<PostGroup> findP1WithUser(String loginId) throws SQLException {
		return postGroupDAO.findP1WithUser(loginId);
	}
	
	//c1
	public List<CommentGroup> findC1WithUser(int userId) throws SQLException {
		return commentP1DAO.findC1WithUser(userId);
	}
	/*
	//c2
		public int createC2(CommentPetstargram ci) throws SQLException {
			return commentP2DAO.create(ci);
		}
		
		public int updateC2(CommentPetstargram ci) throws SQLException {
			return commentP2DAO.update(ci);
		}
		
		public int removeC2(int commentId) throws SQLException {
			return commentP2DAO.remove(commentId);
		}
		
		public CommentPetstargram findC2(int commentId) throws SQLException{
			return commentP2DAO.findC2(commentId);
		}
		
		public List<CommentPetstargram> findC2List() throws SQLException {
			return commentP2DAO.findC2List();
		}
	*/
	
	//petstargram community
	public int createP2Petstargram(PostPetstargram post) throws SQLException {
		return postPetstargramDAO.create(post);	
	}
	
	public int updateP2Petstargram(PostPetstargram post) throws SQLException {
		return postPetstargramDAO.update(post);
	}
	
	public int removeP2Petstargram(int postId) throws SQLException{
		return postPetstargramDAO.remove(postId);
	}
	public PostPetstargram findP2Petstargram(int postId) throws SQLException {
		PostPetstargram post = postPetstargramDAO.findPost(postId); 
		
		return post;
	}
	
	public List<PostPetstargram> searchP2List(String postTitle, Date start, Date end) throws SQLException {
		return postPetstargramDAO.searchP2List(postTitle, start, end);
	}
	
	public List<PostPetstargram> findP2List() throws SQLException {
		return postPetstargramDAO.findP2List();
	}
	
	public List<PostPetstargram> findP2WithUser(String loginId) throws SQLException {
		return postPetstargramDAO.findP2WithUser(loginId);
	}
	
	//c2
	public int createC2(CommentPetstargram ci) throws SQLException {
		return commentP2DAO.create(ci);
	}
	
	public int updateC2(CommentPetstargram ci) throws SQLException {
		return commentP2DAO.update(ci);
	}
	
	public int removeC2(int commentId) throws SQLException {
		return commentP2DAO.remove(commentId);
	}
	
	public CommentPetstargram findC2(int commentId) throws SQLException{
		return commentP2DAO.findC2(commentId);
	}
	
	public List<CommentPetstargram> findC2List() throws SQLException {
		return commentP2DAO.findC2List();
	}
	
	public List<CommentPetstargram> findC2WithUser(int userId) throws SQLException {
		return commentP2DAO.findC2WithUser(userId);
	}
	
	//adoption community
	public int createP3Adoption(PostAdoption post) throws SQLException {
		return postAdoptionDAO.create(post);	
	}
	
	public int updateP3Adoption(PostAdoption post) throws SQLException {
		return postAdoptionDAO.update(post);
	}
	
	public int removeP3Adoption(int postId) throws SQLException{
		return postAdoptionDAO.remove(postId);
	}
	public PostAdoption findP3Adoption(int postId) throws SQLException {
		PostAdoption post = postAdoptionDAO.findPost(postId); 
		
		return post;
	}
	
	public List<PostAdoption> searchP3List(String postTitle, Date start, Date end) throws SQLException {
		return postAdoptionDAO.searchP3List(postTitle, start, end);
	}
	
	public List<PostAdoption> findP3List() throws SQLException {
		return postAdoptionDAO.findP3List();
	}
	
	public List<PostAdoption> findP3WithUser(String loginId) throws SQLException {
		return postAdoptionDAO.findP3WithUser(loginId);
	}
	//c3
	public List<CommentAdoption> findC3WithUser(int userId) throws SQLException {
		return commentP3DAO.findC3WithUser(userId);
	}
	
	/*
	//c2
		public int createC2(CommentPetstargram ci) throws SQLException {
			return commentP2DAO.create(ci);
		}
		
		public int updateC2(CommentPetstargram ci) throws SQLException {
			return commentP2DAO.update(ci);
		}
		
		public int removeC2(int commentId) throws SQLException {
			return commentP2DAO.remove(commentId);
		}
		
		public CommentPetstargram findC2(int commentId) throws SQLException{
			return commentP2DAO.findC2(commentId);
		}
		
		public List<CommentPetstargram> findC2List() throws SQLException {
			return commentP2DAO.findC2List();
		}
	*/
	
	//apply
	public int createApply(Apply apply) throws SQLException, ExistingUserException {
		return applyDAO.create(apply);
	}
	
	public int removeApply(int applyId) throws SQLException{
		return applyDAO.remove(applyId);
	}
	
	public Apply findApply(int applyId) throws SQLException {
		return applyDAO.findApply(applyId); 
	}
	
	public List<Apply> findApplyList() throws SQLException {
		return applyDAO.findApplyList();
	}
}
