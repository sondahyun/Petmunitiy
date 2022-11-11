package model;

import java.util.ArrayList;
import java.util.Date;

/**
 * ����� ������ ���� �ʿ��� ������ Ŭ����. USERINFO ���̺�� ������
 */
public class UserInfo {
	private int userId;	
	private String loginId;
	private String loginPwd;
	private String userNickname;
	private Date userBirth;
	private String phoneNumber;
	private String gender;
	private String address;
	//private int petList;
	private ArrayList<Integer> petList; //ArrayList<Integer> => Array(UserDAO findUser���� getArray�� ����

	public UserInfo() {
	}

	public UserInfo(int userId, String loginId, String loginPwd, String userNickname, Date userBirth,
			String phoneNumber, String gender, String address, ArrayList<Integer> petList) {
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



	public ArrayList<Integer> getPetList() {
		return petList;
	}



	public void setPetList(ArrayList<Integer> petList) {
		this.petList = petList;
	}



	/* ��й�ȣ �˻� */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.loginPwd.equals(password);
	}
	
	public boolean isSameUser(UserInfo user) {
        return this.loginId.equals(user.loginId);
    }

	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", loginId=" + loginId + ", loginPwd=" + loginPwd + ", userNickname="
				+ userNickname + ", userBirth=" + userBirth + ", phoneNumber=" + phoneNumber + ", gender=" + gender
				+ ", address=" + address + ", petList=" + petList + "]";
	}
	
}
