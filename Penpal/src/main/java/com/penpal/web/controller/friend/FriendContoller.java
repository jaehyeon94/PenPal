package com.penpal.web.controller.friend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penpal.web.model.service.FriendService;

@Controller
@RequestMapping("/")
public class FriendContoller {

	
	@Autowired
	FriendService friendService;

	@RequestMapping("insertfriend.do")
	public String insertfriend(String id) {
		friendService.insertFriend(id);
	
		return "redirect:search";
		
	}
	
	@RequestMapping("removefriend.do")
	public String removefriend(String id) {
		friendService.insertFriend(id);
	
		return "redirect:search";
		
	}
	
	
	
}