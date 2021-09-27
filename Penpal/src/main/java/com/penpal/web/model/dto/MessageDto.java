package com.penpal.web.model.dto;

import java.sql.Timestamp;

public class MessageDto {

	private String message_no;
	private String id;
	private String friend_id;
	private String friend_name;
	private String message_title;
	private String message;
	private int select_ck;
	private Timestamp birth;

	public String getMessage_no() {
		return message_no;
	}

	public void setMessage_no(String message_no) {
		this.message_no = message_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFriend_id() {
		return friend_id;
	}

	public String getFriend_name() {
		return friend_name;
	}

	public void setFriend_name(String friend_name) {
		this.friend_name = friend_name;
	}

	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	

	public int getSelect_ck() {
		return select_ck;
	}

	public void setSelect_ck(int select_ck) {
		this.select_ck = select_ck;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "MessageDto [id=" + id + ", friend_id=" + friend_id + ", message_title=" + message_title + ", message="
				+ message + ", ck=" + select_ck + ", birth=" + birth + "]";
	}

}
