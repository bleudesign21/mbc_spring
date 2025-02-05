package com.mbc.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.mapper.UserMapper;
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
	
	// 회원가입
	@RequestMapping("/memberInsert.do")
	public String memberInsert(UserDTO dto) {
		int cnt = service.registerUser(dto);
		
		return "redirect:memberList.do";
	}		
	
	// 회원리스트
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		List<UserDTO> userList = service.userList();
		// 바인딩
		model.addAttribute("list", userList);
		
		return "member/userList";
	}
	
	
	// 회원상세정보
	@RequestMapping("/memberInfo.do")
	public String memberInfo(int uno, Model model) {
		UserDTO dto = service.userInfo(uno);
		// 바인딩
		model.addAttribute("dto", dto);
		
		return "member/userInfo";
	}
	
	// 회원수정
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(UserDTO dto) {
		service.modifyUser(dto);
		
		return "redirect:memberList.do";
	}
	
	// 회원삭제
	@RequestMapping("/memberDelete.do")
	public String memberDelete(int uno) {
		service.removeUser(uno);
		
		return "redirect:memberList.do";
	}
}
