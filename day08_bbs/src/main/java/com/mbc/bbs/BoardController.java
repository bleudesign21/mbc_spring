package com.mbc.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbc.mapper.BoardMapper;
import com.mbc.model.BoardDTO;
import com.mbc.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	// 게시글 등록 페이지
	@GetMapping("/register.do")
	public String register() {
		return "board/register";
	}
	
	// 게시글 등록 처리
	@PostMapping("/register.do")
	public String register(BoardDTO dto) {
		service.register(dto);
		return "redirect:/board/list.do";
	}
	
	// 게시글 리스트
	@GetMapping("/list.do")
	public String list(Model model) {
		List<BoardDTO> list = service.getList();
		model.addAttribute("list",list);
		return "board/boardList";
	}
	
	// 게시글 상세페이지 이동
	@GetMapping("/view.do")
	public String view(int bid, Model model) {
		BoardDTO dto=service.view(bid, "v");
		model.addAttribute("dto", dto);
		return "board/view";
	}
	
	// 수정 페이지 이동
	@GetMapping("/modify.do")
	public String updateForm(int bid, Model model) {
		BoardDTO dto=service.view(bid, "m");
		model.addAttribute("dto", dto);
		return "board/modify";
	}
	
	// 게시글 수정처리
	@PostMapping("/modify.do")
	public String modify(BoardDTO dto) {
		service.modify(dto);
		return "redirect:list.do";
	}
	
	// 게시글 삭제
	@GetMapping("/remove.do")
	public String remove(int bid) {
		service.remove(bid);
		return "redirect:list.do";
	}
	
	// 좋아요
	@GetMapping("/like.do")
	public String addLike(int bid) {
		service.addLike(bid);
		return "redirect:list.do";
	}
	
}
