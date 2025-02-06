package com.mbc.find;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.mapper.BoardMapper;
import com.mbc.model.BoardDTO;
import com.mbc.model.PageDTO;
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
		
//		for(int i=1; i<=123; i++) {
//			BoardDTO bDto = new BoardDTO();
//			bDto.setSubject(i + "번째 제목입니다~~~");
//			bDto.setContents(i + "번째 내용입니다~~~");
//			bDto.setWriter("아무개 " + (i%10));
//			service.register(bDto);
//		}
		
		service.register(dto);
		return "redirect:/board/list.do";
	}
	
	// 게시글 리스트
//	@GetMapping("/list.do")
//	public String list(Model model) {
//		List<BoardDTO> list = service.getList();
//		model.addAttribute("list",list);
//		return "board/boardList";
//	}
	
	// 게시글 리스트 - 페이징 처리
	@RequestMapping("/list.do")
	// http://localhost:8077/search/board/list.do?viewPage=3
	// viewPage=3 전달되면 PageDTO의 setViewPage(3)메소드가 호출됨
	public String list(PageDTO pDto, Model model) {
		List<BoardDTO> list = service.getList(pDto);
		model.addAttribute("list",list);
		
		// service에서 새로 셋팅된 PageDTO를 바인딩
		model.addAttribute("pDto",pDto);		
		return "board/boardList";
	}
	
	// 게시글 상세페이지 이동
	@GetMapping("/view.do")
	public String view(int bid, PageDTO pDto, Model model) {
		BoardDTO dto=service.view(bid, "v");
		model.addAttribute("dto", dto);
		model.addAttribute("pDto", pDto);
		
		return "board/view";
	}
	
	// 수정 페이지 이동
	@GetMapping("/modify.do")
	public String updateForm(PageDTO pDto, int bid, Model model) {
		BoardDTO dto=service.view(bid, "m");
		model.addAttribute("dto", dto);
		model.addAttribute("pDto", pDto);		
		return "board/modify";
	}
	
	// 게시글 수정처리
	@PostMapping("/modify.do")
	public String modify(PageDTO pDto, BoardDTO dto, Model model) {
		service.modify(dto);
		int viewPage = pDto.getViewPage();
		
		model.addAttribute("viewPage", viewPage);
		model.addAttribute("searchType", pDto.getSearchType());
		model.addAttribute("keyword", pDto.getKeyword());
		model.addAttribute("cntPerPage", pDto.getCntPerPage());
		
		// list.do?viewPage=5 이형태로 리다이렉트 된다, 리다이렉트 model로 바인딩할 경우에는 쿼리스트링으로 전달된다.
		return "redirect:list.do";
	}
	
	// 게시글 삭제
	@GetMapping("/remove.do")
	public String remove(int bid, PageDTO pDto, Model model) {
		service.remove(bid);
		
		model.addAttribute("viewPage", pDto.getViewPage());
		model.addAttribute("searchType", pDto.getSearchType());
		model.addAttribute("keyword", pDto.getKeyword());
		model.addAttribute("cntPerPage", pDto.getCntPerPage());
		
		return "redirect:list.do";
	}
	
	// 좋아요, ajax는 200, 300번대 코드가 오면 success 처리
//	@GetMapping("/like.do")
//	public String addLike(int bid) {
//		service.addLike(bid);
	 // 리다이렉트은 상태코드 302번 리턴, 페이지 이동은 없지만 성공처리됨
//		return "redirect:view.do"; 
//	}
	
	// 좋아요
	@GetMapping("/like.do")
	@ResponseBody
	public String addLike(int bid) {
		service.addLike(bid);
		return "success";
	}
	
}
