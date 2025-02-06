package com.mbc.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.mapper.UserMapper;
import com.mbc.model.PageDTO;
import com.mbc.model.UserDTO;
import com.mbc.service.UserService;

@Controller
@RequestMapping("/member")
public class UserController {
	
	//의존성 주입(DI) 
	@Autowired
//	private UserMapper mapper; 
	private UserService service; 
	
	// Message Converter API : jackson
	// ==> JSON형식의 데이터를 자바객체로 또는
	// 자바객체를 JSON형식으로 변환해주는 API	
	
	// @ResponseBody : 서버 ===> 클라언트, HTTP Message의 body에 담아서 전송
	//                 java객체 --> JSON형식으로 변환해서 클라이언트 전송 
	
	// @RequestBody  : 클라이언트 ===> 서버
	//      HTTP Message Body에 내용(JSON형식) --> 자바객체로 변환해서 서버에서 수신
	
	//ID 중복체크
	@RequestMapping("/memberIdCheck.do")
	@ResponseBody
	public String memberIdCheck(@RequestParam("uid") String uid) {
		System.out.println("uid = " + uid);
		UserDTO dto = service.idCheck(uid);
		
		// DB에 아이디가 있거나 빈값이 넘어왔을 때
		if(dto !=null || "".equals(uid.trim())) {
			return "no"; // 아이디가 있는 경우
		}
		
		return "yes"; // 아이디가 없는 경우		
	}
	
	
	// 회원 가입폼
	@RequestMapping("/memberRegister.do")
	public String memberRegister() {
		return "member/register";
	}
	
	// 회원가입 - 테스트용 데이터, 회원가입페이지에서 가입버튼 클릭
//	@RequestMapping("/memberInsert.do")
//	public String memberInsert() {
//		for(int i=1; i<=123; i++) {
//			UserDTO uDto = new UserDTO();
//			uDto.setId("kim"+i);
//			uDto.setPw("1212");
//			uDto.setName("아무개 " + (i%10));
//			uDto.setAge(33);
//			uDto.setEmail("test"+i+"@gmail.com");
//			uDto.setTel("010-"+"1212"+i);
//			service.registerUser(uDto);
//		}		
//		return "redirect:memberList.do";
//	}		
	
	// 회원가입
	public String memberInsert(UserDTO dto) {
		int cnt = service.registerUser(dto);
		
		return "redirect:memberList.do";
	}		
	
	// 회원리스트
//	@RequestMapping("/memberList.do")
//	public String memberList(Model model) {
//		List<UserDTO> userList = service.userList();
//		// 바인딩
//		model.addAttribute("list", userList);
//		
//		return "member/userList";
//	}
	
	// 회원리스트 - 페이징처리
	@RequestMapping("/memberList.do")
	public String memberList(PageDTO pDto, Model model) {
		List<UserDTO> userList = service.userList(pDto);
		// 바인딩
		model.addAttribute("list", userList);
		model.addAttribute("pDto", pDto);
		return "member/userList";
	}
	
	
	// 회원상세정보
	@RequestMapping("/memberInfo.do")
	public String memberInfo(PageDTO pDto, int uno, Model model) {
		UserDTO dto = service.userInfo(uno);
		// 바인딩
		model.addAttribute("dto", dto);
		model.addAttribute("pDto", pDto);
		
		return "member/userInfo";
	}
	
	// 회원수정
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(PageDTO pDto, UserDTO dto, Model model) {
		service.modifyUser(dto);
		model.addAttribute("viewPage", pDto.getViewPage());
		return "redirect:memberList.do";
	}
	
	// 회원삭제
	@RequestMapping("/memberDelete.do")
	public String memberDelete(int uno) {
		service.removeUser(uno);
		
		return "redirect:memberList.do";
	}
}
