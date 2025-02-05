package com.mbc.testapp2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModelAttr {
	
//	http://localhost:8077/testapp2/score?kor=88&eng=80&math=77
	
	//@ModelAttribute : 
	// #1. 요청 파라미터를 객체 바인딩
	// #2. 데이터를 뷰에 전달
	
	@RequestMapping("/score")
	public String aaa(@ModelAttribute MyScore myscore, Model model) {
		model.addAttribute("myscore", myscore);
		
		return "scoreMvc";
	}
	
//	@RequestMapping("/score")
//	public String aaa(@ModelAttribute MyScore myscore) {
//		// model이 없어도 뷰에 데이터 전달
//		//model.addAttribute("myscore", myscore);		
//		return "scoreMvc";
//	}
	
	//@ModelAttribute 생략된 형태
//	@RequestMapping("/score")
//	public String aaa(MyScore myscore) {
//				
//		return "scoreMvc";
//	}
}
