package com.penpal.web.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penpal.web.model.Paging.Criteria;
import com.penpal.web.model.dao.MessageDao;
import com.penpal.web.model.dto.MemberDto;
import com.penpal.web.model.dto.MessageDto;


@Service
public class MessageServiceImpl implements MessageService{

	
	@Autowired
	MessageDao messageDao;
	
	@Autowired
	private HttpSession session;

	@Override
	public List<Map<String, Object>> selectsendMessageList(Criteria cri) {
	    return messageDao.selectsendMessageList(cri);
	}
	

	@Override
	public List<Map<String, Object>> selectreceiveMessageList(Criteria cri) {
	    return messageDao.selectreceiveMessageList(cri);
	}


	@Override
	public int sendMessageCount(String id) {
		// TODO Auto-generated method stub
		return messageDao.sendMessageCount(id);
	}


	@Override
	public int ReceiveMessageCount(String id) {
		// TODO Auto-generated method stub
		return messageDao.receiveMessageCount(id);
	}


	@Override
	public void insertMessage(MessageDto messageDto) {
		// TODO Auto-generated method stub
		messageDao.insertSendMessage(messageDto);
		MemberDto memberdto = (MemberDto) session.getAttribute("member");
		messageDto.setFriend_name(memberdto.getName());
		messageDao.insertReceiveMessage(messageDto);
	}


	@Override
	public MessageDto getSendMessage(int memberNo) {
		// TODO Auto-generated method stub
		return messageDao.getSendMessage(memberNo);
		
		
	}


	@Override
	public MessageDto getReceiveMessage(int memberNo) {
		// TODO Auto-generated method stub
		return messageDao.getReceiveMessage(memberNo);
	}


	@Override
	public void updateCk(int memberNo) {
		// TODO Auto-generated method stub
		messageDao.updateCk(memberNo);
	}


	




}
