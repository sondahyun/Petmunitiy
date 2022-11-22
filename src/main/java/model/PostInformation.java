package model;

import java.util.ArrayList;
import java.util.Date;

public class PostInformation {
	private int postId;
	private String postTitle;
	private Date postDate;
	private String postContent;
	private String fileName;
	private String kind;
	private int userId;
	
	public PostInformation() { }
	
	public PostInformation(int postId, String postTitle, Date postDate, String postContent,
			String fileName, String kind, int userId) {
		super();
		this.postId = postId;
		this.postTitle = postTitle;
		this.postDate = postDate;
		this.postContent = postContent;
		this.fileName = fileName;
		this.kind = kind;
		this.userId = userId;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "PostInformation [postId=" + postId +  ", postTitle=" + postTitle
				+ ", postDate=" + postDate + ", postContent=" + postContent + ", fileName=" + fileName + ", kind="
				+ kind + ", userId=" + userId + "]";
	}
	
	
}
