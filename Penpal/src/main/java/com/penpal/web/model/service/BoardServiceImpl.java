package com.penpal.web.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penpal.web.model.dao.BoardDao;
import com.penpal.web.model.dao.FriendDao;
import com.penpal.web.model.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;

	@Autowired
	private HttpSession session;

	@Override
	public ArrayList<BoardDto> boardList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.boardList(boardDto);
	}

	@Override
	public int boardCount(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.boardCount(boardDto);
	}

	@Override
	public void insertBoard(BoardDto boardDto) {
		// TODO Auto-generated method stub
		boardDao.insertBoard(boardDto);
	}

	@Override
	public ArrayList<BoardDto> boardMyList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.boardMyList(boardDto);
	}

	@Override
	public ArrayList<BoardDto> boardFriendList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.boardFriendList(boardDto);
	}

	@Override
	public int boardFriendCount(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.boardFriendCount(boardDto);
	}

	@Override
	public int boardMyCount(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.boardMyCount(boardDto);
	}

	
}
