package com.mbc.testapp2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbc.model.MemberDTO;

@Controller
@RequestMapping("/member")
public class ReqMappingController {
	// @RequestMapping : 요청 URL을 컨트롤러의 메소드에 매핑하거나
	// 클래스에 매핑하기위해 사용하는 어노테이션
	// 속성 : method, value,....
	
//	@RequestMapping("/form")는 아래와 동일한 코드, GET방식만 처리
//	@RequestMapping(value="/form", method=RequestMethod.GET)
	
//	@RequestMapping(value="/form", method=RequestMethod.POST) // POST처리
	
	// GET, POST 둘다처리
//	@RequestMapping(value="/form", method= {RequestMethod.GET,RequestMethod.POST})
//	public String register() {
//		
//		return "registerForm";
//	}
	
	@GetMapping("/form") // 4.3부터 지원
	public String register() {
		return "registerForm";
	}
	
	@PostMapping("/form")
//	@RequestMapping(value="/form", method=RequestMethod.POST)
//	public String registerInfo(MemberDTO member) {
	public String registerInfo(MemberDTO dto, RedirectAttributes rttr, Model model) {
		
		model.addAttribute("member", dto);
	
		if(!chkParam(dto)) {
			String msg = "check error!!";
			
			// redirect시에 model로 바인딩하는 경우
			// query string으로 전달
//			model.addAttribute("msg",msg);  
			
			// addFlashAttribute()는 일회성 데이터 전달
			rttr.addFlashAttribute("msg", msg);
			// 스프링은 재요청(response.sendRedirect())시에 접두어 redirect: 사용한다.
			// redirect은 GET방식 요청
			return "redirect:/form";
		}
		return "registerInfo";
	}
	
	// 유효성 체크 메소드로 가정
	private boolean chkParam(MemberDTO dto) {
		return false;
	}
	
	
}
