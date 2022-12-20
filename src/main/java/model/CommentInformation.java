package model;

import java.util.Date;

public class CommentInformation implements Comparable{
	private int commentId;
	private Date commentDate;
	private String commentContent;
	private int postId;
	private int userId;
	
	public CommentInformation() {}
	
	public CommentInformation(int commentId, Date commentDate, String commentContent, int postId, int userId) {
		super();
		this.commentId = commentId;
		this.commentDate = commentDate;
		this.commentContent = commentContent;
		this.postId = postId;
		this.userId = userId;
	}
	
	public CommentInformation(int commentId, String commentContent, int postId, int userId) {
		super();
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.postId = postId;
		this.userId = userId;
	}


	public CommentInformation(Date commentDate, String commentContent, int postId, int userId) {
		super();
		this.commentDate = commentDate;
		this.commentContent = commentContent;
		this.postId = postId;
		this.userId = userId;
	}
	
	public CommentInformation(String commentContent, int postId, int userId) {
		super();
		this.commentContent = commentContent;
		this.postId = postId;
		this.userId = userId;
	}


	public int getCommentId() {
		return commentId;
	}


	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}


	public Date getCommentDate() {
		return commentDate;
	}


	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}


	public String getCommentContent() {
		return commentContent;
	}


	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	public int getPostId() {
		return postId;
	}


	public void setPostId(int postId) {
		this.postId = postId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "CommentInformation [commentId=" + commentId + ", commentDate=" + commentDate + ", commentContent="
				+ commentContent + ", postId=" + postId + ", userId=" + userId + "]";
	}

	@Override
	public int compareTo(Object o) {
		CommentInformation cm = (CommentInformation) o;
		
		if(cm.commentId < this.commentId)
			return -1;
		else return 1;
	}
	
	
	
	
}
