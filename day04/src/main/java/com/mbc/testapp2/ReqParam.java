package com.mbc.testapp2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReqParam {
//	http://localhost:8077/testapp2/hello?name=kim, name=> 요청파라미터
	
//	@RequestMapping("/hello")
//	public void hello(String name) { //@RequestParam 생략(요청파라미터와 매개변수명이 같을때)
//		System.out.println("hello! "+ name);
//	}
	
	// @RequestParam는 요청파라미터를 메서드의 매개변수로 바인딩할 때 사용
	// 속성
	// value         요청 파라미터의 이름을 지정합니다.   
	// required      해당 요청 파라미터가 필수인지 여부를 지정합니다.   (기본값 : true)
	// defaultValue  요청 파라미터가 없거나 값이 비어 있을 때 사용할 기본값을 지정
	
	@RequestMapping("/hello")
	public void hello(@RequestParam String name) {
		System.out.println("hello! "+ name);
	}
	
//	http://localhost:8077/testapp2/search?query=dog
	@RequestMapping("/search")
	public void search(@RequestParam(value="query") String s) {
		System.out.println("search : "+ s);
	}
//	http://localhost:8077/testapp2/optional?name=kim
//	http://localhost:8077/testapp2/optional
//	required = false이면 해당 파라미터가 없어도 요청을 처리
//	required = true이면 해당 파라미터가 반드시 있어야 함
	@RequestMapping("/optional")
	public void option(@RequestParam(required= true) String name) {
		System.out.println("name : "+ name);
	}
	
//	http://localhost:8077/testapp2/default 
//	http://localhost:8077/testapp2/default?lang=python
	// 파라미터가 없거나 비었을 때 기본값 설정
	@RequestMapping("/default")
	public void defaultValue(@RequestParam(defaultValue="java") String lang) {
		System.out.println("lang : "+ lang);
	}
	
	
}
