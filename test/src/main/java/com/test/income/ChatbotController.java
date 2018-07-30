package com.test.income;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller								
@RequestMapping("chatbot")				
public class ChatbotController {		

	@RequestMapping("/")	
	public String init() {				
		return "chatbot";	
		
	}
/*	
	
	@RequestMapping()
	 // 왓슨과의 대화한 것을 가로챌 메서드

	@RequestMapping()
	 // 계산 한 값을 가져와서 뷰에 뿌려줄 전송할 메서드
*/	
}