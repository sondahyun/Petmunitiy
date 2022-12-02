package model;

import java.util.ArrayList;
import java.util.Date;

public class PostAdoption implements Comparable {
	private int postId;
	private String postTitle;
	private Date postDate;
	private int aType;
	private int approval;
	private Date approvalDate;
	private String postContent;
	private String loginId;
	
	
	public PostAdoption() {
		super();
	}
	
	public PostAdoption(String postTitle, Date postDate, int aType, int approval, Date approvalDate, String postContent, String loginId) {
		super();
		this.postTitle = postTitle;
		this.postDate = postDate;
		this.aType = aType;
		this.approval = approval;
		this.approvalDate = approvalDate;
		this.postContent = postContent;
		this.loginId = loginId;
	}

	public PostAdoption(int postId, String postTitle, Date postDate, int aType, int approval, Date approvalDate, String postContent, String loginId) {
		super();
		this.postId = postId;
		this.postTitle = postTitle;
		this.postDate = postDate;
		this.aType = aType;
		this.approval = approval;
		this.approvalDate = approvalDate;
		this.postContent = postContent;
		this.loginId = loginId;
	}
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public int getaType() {
		return aType;
	}
	public void setaType(int aType) {
		this.aType = aType;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	@Override
	public String toString() {
		return "PostAdoption [postId=" + postId + ", postTitle=" + postTitle + ", postDate=" + postDate
				+ ", postContent=" + postContent + ", aType=" + aType + ", approval=" + approval + ", approvalDate="
				+ approvalDate + ", loginId=" + loginId + "]";
	}
	
	@Override
	public int compareTo(Object o) {
		PostInformation obj = (PostInformation)o;
		if(this.postId - obj.getPostId() == 1)
			return -1;
		else return 1;
	}

}