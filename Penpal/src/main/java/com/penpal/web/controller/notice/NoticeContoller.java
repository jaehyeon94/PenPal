package com.penpal.web.controller.notice;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.codec.multipart.MultipartHttpMessageReader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.penpal.web.model.dto.BoardDto;
import com.penpal.web.model.dto.MemberDto;
import com.penpal.web.model.service.BoardService;
import com.penpal.web.model.service.FriendService;
import com.penpal.web.model.service.MemberService;

@Controller
@RequestMapping("/")
public class NoticeContoller {

	@Autowired
	MemberService memberService;

	@Autowired
	private HttpSession session;
	
	@Autowired
	FriendService friendService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("login")
	public String login(String id, String password) {

		return "customer/notice/login";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginDo(String id, String password) throws ClassNotFoundException, SQLException {

		MemberDto memberDto = memberService.myinfo(id, password);
		memberDto.setHobby(memberService.getHobby(id));	
		if (memberDto != null) {
			session.setAttribute("member", memberDto);
			return "redirect:/index";
		} else {
			return null;
		}
	}

	@RequestMapping("logout.do")
	public String login() {
		session.removeAttribute("member");
		return "root.index";
	}

	@RequestMapping("membership")
	public String membership() {
		return "customer/notice/join-membership";

	}

	@RequestMapping("membership.do")
	public String membershipDo(HttpServletRequest request) {
		MemberDto memberDto = new MemberDto();
		memberDto.setId(request.getParameter("id"));
		memberDto.setPassword(request.getParameter("password"));
		memberDto.setName(request.getParameter("name"));
		memberDto.setBirth(request.getParameter("birth"));
		memberDto.setGender(request.getParameter("gender"));
		memberDto.setNationality(request.getParameter("nationality"));
		memberDto.setAge(Integer.parseInt(request.getParameter("age")));
		memberDto.setQuestion(request.getParameter("question"));
		memberDto.setAnswer(request.getParameter("answer"));

		List<String> list = new ArrayList<String>();
		String[] ck = request.getParameterValues("hobby");
		for (int i = 0; i < ck.length; i++) {
			list.add(ck[i]);
			System.out.println(ck[i]);
		}
		memberDto.setHobby(list);

		memberService.insert(memberDto);
		return "root.index";

	}

	@ResponseBody
	@RequestMapping(value = "checkId.do")
	public int idCheck(String id, ModelAndView mav) {
		int result = 0;
		MemberDto user = memberService.getUser(id);
		if (user != null) {
			System.out.println(user.getId());
			result = 1;
		}
		return result;
	}

	@RequestMapping("profile")
	public String profile(Model model) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
	
		
		BoardDto boardDto = new BoardDto();
		boardDto.setId(memberDto.getId());
		int totalRow = boardService.boardMyCount(boardDto);		
		int follow = friendService.selectFollow(memberDto.getId());
		int follower = friendService.selectFollower(memberDto.getId());
		model.addAttribute("totalRow",totalRow);
		model.addAttribute("follow", follow);
		model.addAttribute("follower", follower);
		
		return "member.profile";
	}

	@RequestMapping("memberupdate")
	public String member_update() {
		return "customer/notice/member-update";
	}
	
	@RequestMapping("memberupdate.do")
	public String member_updateDo(HttpServletRequest request) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		memberDto.setPassword(request.getParameter("password"));
		memberDto.setNationality(request.getParameter("nationality"));
		memberDto.setQuestion(request.getParameter("question"));
		memberDto.setAnswer(request.getParameter("answer"));
		List<String> list = new ArrayList<String>();
		String[] ck = request.getParameterValues("hobby");
		for (int i = 0; i < ck.length; i++) {
			list.add(ck[i]);
		}
		memberDto.setHobby(list);
		memberService.updatemember(memberDto);
		
		return "member.profile";
	}
	
	

//    @ResponseBody
//    @RequestMapping(value="/checkNickName.do")
//    public int nickNameCheck(MemberDto udto,ModelAndView mav) {
//        int result=0;
//      //  Member user=userService.getNickNameUser(udto);
//      //  if(user!=null) result=1;
//        return result;
//    }

	@ResponseBody
	@RequestMapping(value = "/fileup", method = RequestMethod.POST)
	public String result(@RequestParam("file1") MultipartFile multi, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		System.out.println("업로드 실행 ");
		try {
			String path = request.getServletContext().getRealPath("/resources/static/images");
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName(extName);

			System.out.println("uploadpath : " + uploadpath);
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			MemberDto memberDto = (MemberDto) session.getAttribute("member");
			
			memberDto.setPhoto(saveFileName);
			memberService.updateImg(memberDto);
			session.removeAttribute("member");
			session.setAttribute("member", memberDto);
			
			if (!multi.isEmpty()) {
				File file = new File(uploadpath, saveFileName);
				multi.transferTo(file);
				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());
				return "filelist";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:root.index";
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}

}
