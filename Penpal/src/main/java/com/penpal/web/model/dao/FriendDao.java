package com.penpal.web.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.penpal.web.model.dto.FriendDto;

@Repository
public class FriendDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void insertFirend(FriendDto friendDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("friend.insertFirend", friendDto);
		
	}
	
	public FriendDto selectFirend(FriendDto friendDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("friend.selectFirend", friendDto);
		
	}
	
	public int selectFollow(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("friend.selectFollow", id);
		
	}

	public int selectFollower(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("friend.selectFollower", id);
		
	}
	
	
}
