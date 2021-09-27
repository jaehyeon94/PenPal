package com.penpal.web.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlRowSetResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.penpal.web.model.dto.BoardDto;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<BoardDto> boardList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		ArrayList<BoardDto> list = (ArrayList) sqlSession.selectList("board.board_list" ,boardDto); 
		return list;
	}

	public int boardCount(BoardDto boardDto) {
		// TODO Auto-generated method stub
		
		int result = sqlSession.selectOne("board.board_count",boardDto);
		return result;
	}

	public void insertBoard(BoardDto boardDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("board.insert_board", boardDto);
	}

	public ArrayList<BoardDto> boardMyList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		ArrayList<BoardDto> list = (ArrayList) sqlSession.selectList("board.board_my_list" ,boardDto); 
		return list;
	}

	public ArrayList<BoardDto> boardFriendList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		ArrayList<BoardDto> list = (ArrayList) sqlSession.selectList("board.board_friend_list" ,boardDto); 
		return list;
	}

	public int boardFriendCount(BoardDto boardDto) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("board.board_friend_count",boardDto);
		return result;
	}

	public int boardMyCount(BoardDto boardDto) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("board.board_my_count",boardDto);
		return result;
	}

	

}
