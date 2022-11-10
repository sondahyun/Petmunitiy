package model;

import java.util.Date;

/**
 * 사용자 관리를 위해 필요한 도메인 클래스. USERINFO 테이블과 대응됨
 */
public class UserList {
	private int userId;	
	private String loginId;
	private String loginPwd;
	private String userNickname;
	private Date userBirth;
	private String phoneNumber;
	private String gender;
	private String address;
	private int petList;
	//private ArrayList<Integer> petList; //ArrayList<Integer> => Array(UserDAO findUser에서 getArray만 가능

	public UserList() {
	}

	public UserList(int userId, String loginId, String loginPwd, String userNickname, Date userBirth,
			String phoneNumber, String gender, String address, int petList) {
		this.userId = userId;
		this.loginId = loginId;
		this.loginPwd = loginPwd;
		this.userNickname = userNickname;
		this.userBirth = userBirth;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.address = address;
		this.petList = petList;
	}

	
	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getLoginId() {
		return loginId;
	}



	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}



	public String getLoginPwd() {
		return loginPwd;
	}



	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}



	public String getUserNickname() {
		return userNickname;
	}



	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}



	public Date getUserBirth() {
		return userBirth;
	}



	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}



	public String getPhoneNumber() {
		return phoneNumber;
	}



	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public int getPetList() {
		return petList;
	}



	public void setPetList(int petList) {
		this.petList = petList;
	}



	/* 비밀번호 검사 */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.loginPwd.equals(password);
	}
	
	public boolean isSameUser(UserList user) {
        return this.loginId.equals(user.loginId);
    }

	@Override
	public String toString() {
		return "UserList [userId=" + userId + ", loginId=" + loginId + ", loginPwd=" + loginPwd + ", userNickname="
				+ userNickname + ", userBirth=" + userBirth + ", phoneNumber=" + phoneNumber + ", gender=" + gender
				+ ", address=" + address + ", petList=" + petList + "]";
	}
	
}
