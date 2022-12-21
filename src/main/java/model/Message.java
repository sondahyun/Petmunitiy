package model;

import java.util.Date;

public class Message implements Comparable{
	private int messageId;
	private int sender;
	private int receiver;
	private String content;
	private Date sendDate;
	private String mTitle;

	public Message() {
		super();
	}

	public Message(int sender, int receiver, String content, String mTitle) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.mTitle = mTitle;
	}

	public Message(int sender, int receiver, String content, Date sendDate, String mTitle) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.sendDate = sendDate;
		this.mTitle = mTitle;
	}

	public Message(int messageId, int sender, int receiver, String content, Date sendDate, String mTitle) {
		super();
		this.messageId = messageId;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.sendDate = sendDate;
		this.mTitle = mTitle;
	}

	public int getMessageId() {
		return messageId;
	}



	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}



	public int getSender() {
		return sender;
	}



	public void setSender(int sender) {
		this.sender = sender;
	}



	public int getReceiver() {
		return receiver;
	}



	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getSendDate() {
		return sendDate;
	}



	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	
	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", sender=" + sender + ", receiver=" + receiver + ", content="
				+ content + ", sendDate=" + sendDate + ", mTitle=" + mTitle + "]";
	}

	@Override
	public int compareTo(Object o) {
		Message m = (Message) o;
		if(m.messageId < this.messageId)
			return -1;
		else return 1;
	}
	
}
