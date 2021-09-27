package com.penpal.web.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penpal.web.model.dao.MemberDao;
import com.penpal.web.model.dto.MemberDto;

@Service()
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberdao;
	
	@Autowired
	private HttpSession session;

	@Override
	public List<MemberDto> getMembers(MemberDto member) {
		// TODO Auto-generated method stub
		
		List<MemberDto> memberDtos =  memberdao.getMemberID(member);
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		for(int i = 0; i < memberDtos.size(); i++ ) {
			if(memberDto.getId().equals(memberDtos.get(i).getId())) {
				memberDtos.remove(i);
			}
		}
		
		List<MemberDto> members = new ArrayList<MemberDto>();
		for(int i = 0; i < memberDtos.size(); i++) {
			MemberDto memberDto1 = memberdao.getMember(memberDtos.get(i));
			memberDto1.setHobby(memberdao.getHobby(memberDtos.get(i).getId()));
			members.add(memberDto1);
		}
		return members;
	}

	@Override
	public MemberDto getMember(String id)  {
		// TODO Auto-generated method stub	
		MemberDto memberDto = memberdao.getMember(new MemberDto(id));
		memberDto.setHobby(memberdao.getHobby(memberDto.getId()));
		return memberDto;
	}

	@Override
	public int insert(MemberDto member)  {
		// TODO Auto-generated method stub
		memberdao.insert(member);
		return 0;
	}
	
	@Override
	public int idck(String id) {
		// TODO Auto-generated method stub
		return memberdao.idck(id);
	}

	@Override
	public int update(MemberDto notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id)  {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto myinfo(String id, String password) {
		// TODO Auto-generated method stub
		return memberdao.myinfo(id, password);
	
	}

	@Override
	public MemberDto getUser(String id) {
		// TODO Auto-generated method stub
		
		 return memberdao.getUser(id);
	}

	@Override
	public List getHobby(String id) {
		// TODO Auto-generated method stub
		return memberdao.getHobby(id);
	}


	@Override
	public void updateImg(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberdao.updateImg(memberDto);
	}

	@Override
	public void updatemember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberdao.updatemember(memberDto);

	}

}
