package com.penpal.web.controller.board;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.penpal.web.model.dto.BoardDto;
import com.penpal.web.model.dto.MemberDto;
import com.penpal.web.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private HttpSession session;

	@Autowired
	private BoardService boardService;

	

	@RequestMapping("board_every")
	public String board_every(HttpServletRequest request, String ck) {

		final int RAGE_ROW_COUNT = 5;

		int pageNum = 1;
		
		String strPageNum = request.getParameter("pageNum");

		if (strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}

		int startRowNum = 0 + (pageNum - 1) * RAGE_ROW_COUNT;

		int endRowNum = pageNum * RAGE_ROW_COUNT;

		int rowCount = RAGE_ROW_COUNT;

		BoardDto boardDto = new BoardDto();
		boardDto.setStartRowNum(startRowNum);
		boardDto.setEndRowNum(endRowNum);
		boardDto.setRowCount(rowCount);

		ArrayList<BoardDto> list = null;

		int totalRow = 0;

		if (session.getAttribute("member") == null) {
			list = boardService.boardList(boardDto);
			totalRow = boardService.boardCount(boardDto);
		} else {
			MemberDto memberDto = (MemberDto) session.getAttribute("member");
			boardDto.setId(memberDto.getId());
			if(ck.equals("every")) {
				list = boardService.boardList(boardDto);
				totalRow = boardService.boardCount(boardDto);
			} else if(ck.equals("friend")) {
				list = boardService.boardFriendList(boardDto);
				totalRow = boardService.boardFriendCount(boardDto);
			} else if(ck.equals("my")) {
				list = boardService.boardMyList(boardDto);
				totalRow = boardService.boardMyCount(boardDto);
			}
			request.setAttribute("memberid", memberDto.getId());
		}

		int totalPageCount = (int) Math.ceil(totalRow / (double) RAGE_ROW_COUNT);

		request.setAttribute("list", list);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);
		
		request.setAttribute("ck",ck);
		return "board.every-board";
	}

	@RequestMapping("boardPage.do")
	public String ajax_page(HttpServletRequest request) {
		final int RAGE_ROW_COUNT = 5;
		int pageNum = 1;
		
		String ck = request.getParameter("ck");
		String strPageNum = request.getParameter("pageNum");

		if (strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}

		int startRowNum = 0 + (pageNum - 1) * RAGE_ROW_COUNT;

		int endRowNum = pageNum * RAGE_ROW_COUNT;

		int rowCount = RAGE_ROW_COUNT;

		BoardDto boardDto = new BoardDto();
		boardDto.setStartRowNum(startRowNum);
		boardDto.setEndRowNum(endRowNum);
		boardDto.setRowCount(rowCount);
		
		ArrayList<BoardDto> list = null;

		int totalRow = 0;
		
		
		if (session.getAttribute("member") == null) {
			list = boardService.boardList(boardDto);
			totalRow = boardService.boardCount(boardDto);
		} else {
			MemberDto memberDto = (MemberDto) session.getAttribute("member");
			boardDto.setId(memberDto.getId());
			if(ck.equals("every")) {
				list = boardService.boardList(boardDto);
				totalRow = boardService.boardCount(boardDto);
				
			} else if(ck.equals("friend")) {
				list = boardService.boardFriendList(boardDto);
				totalRow = boardService.boardFriendCount(boardDto);
			
			} else if(ck.equals("my")) {
				list = boardService.boardMyList(boardDto);
				totalRow = boardService.boardMyCount(boardDto);
			}
			request.setAttribute("memberid", memberDto.getId());
		}


		totalRow = boardService.boardCount(boardDto);
		int totalPageCount = (int) Math.ceil(totalRow / (double) RAGE_ROW_COUNT);

		request.setAttribute("list", list);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);

		
		
		
		return "customer/board/ajax_page";

	}
	
	
	@RequestMapping("insertBoardform")
	public String insetBoardform(Model model, String ck) {
			return "customer/board/board-insert";
	}
	
	@ResponseBody
	@RequestMapping(value = "insertBoard.do", method = RequestMethod.POST)
	public String insetBoard(@RequestParam("file") MultipartFile multi, HttpServletRequest request,
			HttpServletResponse response, Model model) {
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
		BoardDto boardDto = new BoardDto();
		
		boardDto.setProfile(memberDto.getPhoto());
		boardDto.setPhoto(saveFileName);
		boardDto.setNick(memberDto.getName());
		boardDto.setId(memberDto.getId());
		boardDto.setContent(request.getParameter("content"));
		boardService.insertBoard(boardDto);
		
		
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
		
		
		return "redirect:board.every-board";
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
