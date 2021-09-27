package com.penpal.web.model.service;

import java.util.ArrayList;

import com.penpal.web.model.dto.BoardDto;

public interface BoardService {

	public ArrayList<BoardDto> boardList(BoardDto boardDto);
	public int boardCount(BoardDto boardDto);
	public void insertBoard(BoardDto boardDto);
	public ArrayList<BoardDto> boardMyList(BoardDto boardDto);
	public ArrayList<BoardDto> boardFriendList(BoardDto boardDto);
	public int boardFriendCount(BoardDto boardDto);
	public int boardMyCount(BoardDto boardDto);
	
}
