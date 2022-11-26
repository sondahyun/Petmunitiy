package model;

import java.util.ArrayList;
import java.util.Date;

public class PostAdoption {
	private int postId;
	private String postTitle;
	private Date postDate;
	private int type;
	private int approval;
	private Date approvalDate;
	private String loginId;
	private String postContent;
	
	
	public PostAdoption() {
		super();
	}

	public PostAdoption(String postTitle, Date postDate, int type, int approval, Date approvalDate, String loginId,String postContent) {
		super();
		this.postId = postId;
		this.postTitle = postTitle;
		this.postDate = postDate;
		this.type = type;
		this.approval = approval;
		this.approvalDate = approvalDate;
		this.loginId = loginId;
		this.postContent = postContent;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
				+ ", postContent=" + postContent + ", type=" + type + ", approval=" + approval + ", approvalDate="
				+ approvalDate + ", loginId=" + loginId + "]";
	}

}