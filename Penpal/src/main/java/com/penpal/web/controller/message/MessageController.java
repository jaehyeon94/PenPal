package com.penpal.web.controller.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.penpal.web.model.Paging.Criteria;
import com.penpal.web.model.Paging.PageMaker;
import com.penpal.web.model.dto.MemberDto;
import com.penpal.web.model.dto.MessageDto;
import com.penpal.web.model.service.MessageService;

@Controller
@RequestMapping("/")
public class MessageController {

	@Autowired
	MessageService messageService;

	@Autowired
	private HttpSession session;

	@RequestMapping("message")
	public String search(Model model, String ck, Criteria cri) {

		MemberDto memberdto = (MemberDto) session.getAttribute("member");
		cri.setId(memberdto.getId());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		if (ck.equals("send")) {
			pageMaker.setTotalCount(messageService.sendMessageCount(memberdto.getId()));
			List<Map<String, Object>> list = messageService.selectsendMessageList(cri);
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("ck", ck);

		} else if (ck.equals("receive")) {
			pageMaker.setTotalCount(messageService.ReceiveMessageCount(memberdto.getId()));
			List<Map<String, Object>> list = messageService.selectreceiveMessageList(cri);
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("ck", ck);

		}
		return "message.message";
	}

	@RequestMapping("messageform")
	public String messageform(Model model, String memberid, String membername) {
		model.addAttribute("memberid", memberid);
		model.addAttribute("membername", membername);
		return "customer/message/messageinfo";
	}
	
	
	@ResponseBody
	@RequestMapping(value =  "sendmessage", method = RequestMethod.POST)
	public String sendMessage(@RequestParam("friend_id") String friend_id, @RequestParam("friend_name") String friend_name,
			@RequestParam("title") String title, @RequestParam("message") String message) {
		MemberDto memberdto = (MemberDto) session.getAttribute("member");
		System.out.println(message);
		MessageDto messageDto = new MessageDto();
		messageDto.setFriend_id(friend_id);
		messageDto.setId(memberdto.getId());
		messageDto.setFriend_name(friend_name);
		messageDto.setMessage_title(title);
		messageDto.setMessage(message);

		messageService.insertMessage(messageDto);
		
		return "customer/message/messageinfo";
	}
	
	
	
	
	@RequestMapping(value =  "messageinfo")	
	public String messageinfo(Model model, int memberNo, String ck) {
		MessageDto messageDto = null;
		if(ck.equals("send")) {
			messageDto = messageService.getSendMessage(memberNo);
		} else if(ck.equals("receive")){
			messageDto =  messageService.getReceiveMessage(memberNo);
			messageService.updateCk(memberNo);
		}
		model.addAttribute("massageInfo",messageDto);
		return "customer/message/message-form";
	}
	
	
	
	
	
	
	
	
	
	

}
