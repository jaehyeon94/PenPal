package com.penpal.web.controller.search;

import java.io.Reader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.penpal.web.model.dto.BoardDto;
import com.penpal.web.model.dto.FriendDto;
import com.penpal.web.model.dto.MemberDto;
import com.penpal.web.model.service.BoardService;
import com.penpal.web.model.service.FriendService;
import com.penpal.web.model.service.MemberService;

@Controller
@RequestMapping("/")
public class SearchContoller {

	@Autowired
	MemberService memberService;
	
	@Autowired
	FriendService friendService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("search")
	public String search(Model model) {

		return "search.member-search";
	}

	@RequestMapping(value = "search.do", method = RequestMethod.POST)
	public String searchBut(Model model, HttpServletRequest request) {
		MemberDto memberDto = new MemberDto();
		memberDto.setGender(request.getParameter("gender"));
		memberDto.setNationality(request.getParameter("nationality"));
		int age = Integer.parseInt(request.getParameter("age"));
		int age2 = Integer.parseInt(request.getParameter("age2"));
		if (age < age2) {
			memberDto.setAge(age);
			memberDto.setAge2(age2);
		} else if (age > age2) {
			memberDto.setAge(age2);
			memberDto.setAge2(age);
		} else {
			memberDto.setAge(age);
			memberDto.setAge2(age2);
		}
		memberDto.setBirth(request.getParameter("hobby"));
		List<MemberDto> members = memberService.getMembers(memberDto);
		model.addAttribute("members", members);
	

		return "search.member-search";

	}

	@RequestMapping("memberprofile")
	public String memberprofile(Model model,String id) {
		model.addAttribute("friendck",friendService.selectFriend(id));
		
		
		BoardDto boardDto = new BoardDto();
		boardDto.setId(id);
		int totalRow = boardService.boardMyCount(boardDto);
		int follow = friendService.selectFollow(id);
		int follower = friendService.selectFollower(id);
		model.addAttribute("totalRow",totalRow);
		model.addAttribute("follow", follow);
		model.addAttribute("follower", follower);
		model.addAttribute("memberprofile",memberService.getMember(id));	

		
		
		
		
		return "search.member-profile";
	}
}
