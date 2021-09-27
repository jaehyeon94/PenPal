package com.penpal.web.model.service;

import java.util.List;
import java.util.Map;

import com.penpal.web.model.Paging.Criteria;
import com.penpal.web.model.dto.MessageDto;

public interface MessageService {

	public List<Map<String, Object>> selectsendMessageList(Criteria cri);
	public List<Map<String, Object>> selectreceiveMessageList(Criteria cri);
	public int sendMessageCount(String id);
	public int ReceiveMessageCount(String id);
	public void insertMessage(MessageDto messageDto);
	public MessageDto getSendMessage(int memberNo);
	public MessageDto getReceiveMessage(int memberNo);
	public void updateCk(int memberNo);

	
	
}
