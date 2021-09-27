package com.penpal.web.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penpal.web.model.dao.FriendDao;
import com.penpal.web.model.dto.FriendDto;
import com.penpal.web.model.dto.MemberDto;

@Service()
public class FriendServiceImpl implements FriendService{

	
	@Autowired
	FriendDao FriendDao;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public void insertFriend(String friendId) {
		// TODO Auto-generated method stub
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		FriendDao.insertFirend(new FriendDto(memberDto.getId(),friendId));
	}


	@Override
	public FriendDto selectFriend(String friendId) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		return FriendDao.selectFirend(new FriendDto(memberDto.getId(),friendId));
	}


	@Override
	public int selectFollow(String id) {
		// TODO Auto-generated method stub
		return FriendDao.selectFollow(id);
	}


	@Override
	public int selectFollower(String id) {
		// TODO Auto-generated method stub
		return FriendDao.selectFollower(id);
	}


	
}
