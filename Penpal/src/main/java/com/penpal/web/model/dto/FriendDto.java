package com.penpal.web.model.dto;

public class FriendDto {

	private String id;
	private String friendId;
	
	public FriendDto() {
	}
	
	public FriendDto(String id, String friendId) {
		this.id = id;
		this.friendId = friendId;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFriendId() {
		return friendId;
	}
	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}
	
	@Override
	public String toString() {
		return "FriendDto [id=" + id + ", friendId=" + friendId + "]";
	}
	
	
	
}
