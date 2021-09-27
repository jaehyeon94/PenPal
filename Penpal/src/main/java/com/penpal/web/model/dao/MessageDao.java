package com.penpal.web.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.penpal.web.model.Paging.Criteria;
import com.penpal.web.model.dto.MessageDto;


@Repository
public class MessageDao {

	
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/*
	 * public List<MessageDto> selectSendMessage(String id) { // TODO Auto-generated
	 * method stub return sqlSession.selectList("message.selectSendMessage",id); }
	 */

	public List<Map<String, Object>> selectsendMessageList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("message.selectSendMessage", cri);

	}
	
	public List<Map<String, Object>> selectreceiveMessageList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("message.selectReceiveMessage", cri);
	}
	
	public int sendMessageCount(String id){
	    return (Integer) sqlSession.selectOne("message.SendMessageCount",id);
	}

	public int receiveMessageCount(String id){
	    return (Integer) sqlSession.selectOne("message.ReceiveMessageCount",id);
	}

	public void insertSendMessage(MessageDto messageDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("message.insertSendMessage",messageDto);
	}
	public void insertReceiveMessage(MessageDto messageDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("message.insertReceiveMessage",messageDto);
	}

	public MessageDto getSendMessage(int message_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.getSendMessage", message_no);
	}

	public MessageDto getReceiveMessage(int message_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.getReceiveMessage", message_no);
	}

	public void updateCk(int message_no) {
		// TODO Auto-generated method stub
		sqlSession.update("message.updateSendCk", message_no);
		sqlSession.update("message.updateReceiveCk", message_no);
	}
	
	
	
	
}
