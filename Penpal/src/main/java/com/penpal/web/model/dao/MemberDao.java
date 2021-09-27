package com.penpal.web.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.penpal.web.model.dto.MemberDto;
import com.penpal.web.model.dto.MemberHobbyDto;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;

	public List<MemberDto> getMemberID(MemberDto member) {
		// TODO Auto-generated method stub
		 return sqlSession.selectList("member.memberlist",member);	
	}
	
	public MemberDto getMember(MemberDto member) {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne("member.getUser",member);	
	}

	public void insert(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.insertMember", memberDto);
		for (int i = 0; i < memberDto.getHobby().size(); i++) {
			MemberHobbyDto memberhobby = new MemberHobbyDto();
			memberhobby.setId(memberDto.getId());
			memberhobby.setHobby((String) memberDto.getHobby().get(i));
			sqlSession.insert("member.insertMemberhobby", memberhobby);
		}
		sqlSession.insert("member.insertMemberfinding", memberDto);
	}

	public void updatemember(MemberDto memberDto) {
		// TODO Auto-generated method stub

		sqlSession.update("member.updateMember", memberDto);
		sqlSession.update("member.updateMemberfinding", memberDto);
		sqlSession.delete("member.deleteHobby", memberDto.getId());
		for (int i = 0; i < memberDto.getHobby().size(); i++) {
			MemberHobbyDto memberhobby = new MemberHobbyDto();
			memberhobby.setId(memberDto.getId());
			memberhobby.setHobby((String) memberDto.getHobby().get(i));
			sqlSession.insert("member.insertMemberhobby", memberhobby);
		}
	}

	public int idck(String id) {
		// TODO Auto-generated method stub
		if (sqlSession.selectOne("member.idck", id) == null) {
			return 0;
		} else {
			return 1;
		}
	}

	public void update(MemberDto notice) {
		// TODO Auto-generated method stub
	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public MemberDto myinfo(String id, String password) {
		// TODO Auto-generated method stub
		MemberDto memberDto = new MemberDto();
		memberDto.setId(id);
		memberDto.setPassword(password);

		return (MemberDto) sqlSession.selectOne("member.myinfo", memberDto);

	}

	public MemberDto getUser(String id) {
		// TODO Auto-generated method stub
		return (MemberDto) sqlSession.selectOne("member.getUser", id);
	}

	public List getHobby(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.getHobby", id);
	}

	public void updateImg(MemberDto memberDto) {
		sqlSession.selectList("member.upprofile", memberDto);
	}

}
