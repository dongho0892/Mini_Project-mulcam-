package com.test.income;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.watson.developer_cloud.conversation.v1.Conversation;
import com.ibm.watson.developer_cloud.conversation.v1.model.Context;
import com.ibm.watson.developer_cloud.conversation.v1.model.InputData;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageOptions;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;
import com.tax.income.calculator.TaxCalculator1;

@RestController
@RequestMapping("chatbot")
public class WatsonSay {	//Logger slf4j interface
	private static final Logger logger = LoggerFactory.getLogger(WatsonSay.class);

	@RequestMapping("watsonsay")
	public MessageResponse watsonsay(String isay, HttpSession session) { 
		logger.info("user input : " + isay);

		int result = -999;
		int tax = -999;
		int abcd;
		
//		System.out.println(isay);
		if(isay.equals("")) {
			session.isNew();

	   	 isay="안녕하세요.";
		}
		
		Conversation service = new Conversation(Conversation.VERSION_DATE_2017_05_26);
		service.setUsernameAndPassword("0fbd5c7c-2bfb-4e49-95b3-c8e110ba40bb", "zVNs4j4d30mG");

		System.out.println();
		
		InputData input = new InputData.Builder(isay).build();
	      MessageOptions options=null;
		
		if(!isay.equals("")) {
	         options = 
			new MessageOptions.Builder("3d479c3a-cf43-4aa0-a256-9a4c690a7c27")
			.input(input)
			.context((Context)session.getAttribute("context"))
			.build();  
		} else {
	          options = 
			new MessageOptions.Builder("3d479c3a-cf43-4aa0-a256-9a4c690a7c27") // workspace ID
			.input(input)
			.context((Context)session.getAttribute("context"))
			.build();  
		}
		MessageResponse response = service.message(options).execute(); 
		// 응답에 대한 모든 답을 갖고 있음 -> 이 것이 jsp로 넘어감. 내 결과값을 response에 같이 붙여서 보낸다....

		
		Context context = response.getContext();
		logger.info("salary1 ::::: "+context.get("salary1"));
		
		
		session.setAttribute("context", context);
		if (!context.get("salary1").toString().equals("-999.0")) {
			int k = (int)Double.parseDouble((context.get("salary1").toString()));
			tax = TaxCalculator1.main(k);
			response.put("tax", tax);
			session.setAttribute("tax", tax);
		}

		String watsonsay = response.getOutput().getText().get(0);
		logger.info("context :::::"+response.getContext().toString());
		
		
//		System.out.println("result : "+ result);
//		System.out.println("tax : "+ response.get("tax"));
		
								// jsp에서 접근하는 값    // 
		System.out.println("watconsay : " + watsonsay);		// watson이 말하는 것을 보여줌.
//		logger.info(response.toString()); 	//로그파일
		return response;
	}
}
