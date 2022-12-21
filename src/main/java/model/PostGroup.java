package model;

import java.util.ArrayList;
import java.util.Date;

public class PostGroup implements Comparable {
	private int postId;
	private String postTitle;
	private Date postDate;
	private String postContent;
	private String groupPurpose;
	private String region;
	private int headCount;
	private String fileName;
	private String loginId;	
	
	public PostGroup() {
		super();
	}

	public PostGroup(int postId, String postTitle, String postContent, String groupPurpose, String region,
			String loginId) {
		super();
		this.postId = postId;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.groupPurpose = groupPurpose;
		this.region = region;
		this.loginId = loginId;
	}

	public PostGroup(int postId, String postTitle, String postContent, String groupPurpose, String region,
			String fileName, String loginId) {
		super();
		this.postId = postId;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.groupPurpose = groupPurpose;
		this.region = region;
		this.fileName = fileName;
		this.loginId = loginId;
	}

	public PostGroup(String postTitle, String postContent, String groupPurpose, String region, int headCount,
			String fileName, String loginId) {
		super();
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.groupPurpose = groupPurpose;
		this.region = region;
		this.headCount = headCount;
		this.fileName = fileName;
		this.loginId = loginId;
	}

	public PostGroup(String postTitle, Date postDate, String postContent, String groupPurpose, String region,
			int headCount, String fileName, String loginId) {
		super();
		this.postTitle = postTitle;
		this.postDate = postDate;
		this.postContent = postContent;
		this.groupPurpose = groupPurpose;
		this.region = region;
		this.headCount = headCount;
		this.fileName = fileName;
		this.loginId = loginId;
	}

	public PostGroup(int postId, String postTitle, Date postDate, String postContent, String groupPurpose,
			String region, int headCount, String fileName, String loginId) {
		super();
		this.postId = postId;
		this.postTitle = postTitle;
		this.postDate = postDate;
		this.postContent = postContent;
		this.groupPurpose = groupPurpose;
		this.region = region;
		this.headCount = headCount;
		this.fileName = fileName;
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

	public String getGroupPurpose() {
		return groupPurpose;
	}

	public void setGroupPurpose(String groupPurpose) {
		this.groupPurpose = groupPurpose;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getHeadCount() {
		return headCount;
	}

	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	@Override
	public int compareTo(Object o) {
		PostGroup obj = (PostGroup)o;
		if(this.postId > obj.getPostId())
			return -1;
		else return 1;
	}
	
}
