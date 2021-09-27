package com.penpal.web.model.service;

import java.util.List;

import com.penpal.web.model.dto.MemberDto;

public interface MemberService {

	
	public MemberDto myinfo(String userid, String password);
	public int insert(MemberDto Member);
	public int update(MemberDto notice);
	public int delete(int id);
	public int idck(String id);
	public MemberDto getUser(String id);
	public List getHobby(String id);
	public void updateImg(MemberDto memberDto);
	public void updatemember(MemberDto memberDto);
	public List<MemberDto> getMembers(MemberDto memberDto);
	public MemberDto getMember(String id);
	
}
