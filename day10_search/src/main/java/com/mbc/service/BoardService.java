package com.mbc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbc.mapper.BoardMapper;
import com.mbc.model.BoardDTO;
import com.mbc.model.PageDTO;

@Service
public class BoardService {
	
	@Autowired // BoardMapper 주입
	private BoardMapper mapper;

	// 게시글 등록
	public void register(BoardDTO dto) {
		mapper.insert(dto);
	}	
	
	// 게시글 리스트
//	public List<BoardDTO> getList(){
//		List<BoardDTO> list= mapper.getList();
//		return list;
//	}
	
	// 게시글 리스트 - 페이징 처리 
	public List<BoardDTO> getList(PageDTO pDto){
		
		// 검색어가 있는 경우, searchType, keyword를 전달
		// pDto를 매개변수 사용
		int totalCnt = mapper.totalCnt(pDto);
		
		// 전체게시글 수를 이용해서 startIndex, 등등 페이징 처리에 필요한
		// 멤버변수를 셋팅, ** 새로운 startIndex값이 mapper로 전달 
		pDto.setValue(totalCnt, pDto.getCntPerPage());
		
		// 각 페이지에 해당하는 게시글 리스트 10개를 리턴
		List<BoardDTO> list= mapper.getList(pDto);
		return list;
	}
	
	// 게시글 상세보기(조회수 증가)
	public BoardDTO view(int bid, String mode) {
		if(mode.equals("v"))
			mapper.hitAdd(bid);
		BoardDTO dto= mapper.view(bid);
		return dto;
	}
	
	// 게시글 수정
	public void modify(BoardDTO dto) {
		mapper.update(dto);
	}

	// 게시글 삭제
	public void remove(int bid) {
		mapper.delete(bid);
	}
	
	// 좋아요
	public void addLike(int bid) {
		mapper.likeAdd(bid);
	}
	
	
}
