package com.penpal.web.model.service;

import com.penpal.web.model.dto.FriendDto;

public interface FriendService {

	public void insertFriend(String friendId);
	public FriendDto selectFriend(String friendId);
	public int selectFollow(String id);
	public int selectFollower(String id);

	
	
}
