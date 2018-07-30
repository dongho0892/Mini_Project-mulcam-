<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<c:url value="/resources/js/jquery-3.3.1.js" />"></script>
</head>

<script type="text/javascript">
$(document).ready(function(){			// html을 다 열어놓고 준비하고 있다.
	
	var me = {};
	me.avatar = "<c:url value="/resources/img/Untitled-2.jpg"/>";

	var you = {};
	you.avatar = "<c:url value="/resources/img/chatbot.jpg"/>";

	
	
	$('#btn_restart').click(function(){
		let re = confirm('기존 대화가 모두 사라집니다. \n 다시 대화하시겠습니까?');
		if (re) {
			$('#said').html('');
			ajax_process('');
		}
	});
	$('#txt_isay').keypress(function(e){		// (e)눌린 키를 받아서  
		if(e.which === 13) {			
			conversation();					// 엔터를 치는 사람이 있고
		}
	});		
	$('#btn_isay').click(function(){
		conversation();
	});
	ajax_process('');
});
	
	
	
function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}            

//-- No use time. It is a javaScript effect.
function insertChat(who, text, time){
    if (time === undefined){
        time = 0;
    }
    var control = "";
    var date = formatAMPM(new Date());
    
    if (who == "me"){
        
        control = '<li style="width:100%">' +
                        '<div class="msj macro">' +
                        '<div class="avatar"><img class="img-circle" style="width:100%;" src="'+ me.avatar +'" /></div>' +
                            '<div class="text text-l">' +
                                '<p>'+ text +'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '</div>' +
                    '</li>';                    
    }else{
        control = '<li style="width:100%;">' +
                        '<div class="msj-rta macro">' +
                            '<div class="text text-r">' +
                                '<p>'+text+'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width:100%;" src="'+you.avatar+'" /></div>' +                                
                  '</li>';
    }
    setTimeout(
        function(){                        
            $("ul").append(control);
        }, time);
    
}

	function conversation() {
	let _isay = $.trim($('#txt_isay').val());			// 키 값을 받아 올 거임. // 공백 제거 trim
	if (_isay === '') {
		alert('내용을 입력하세요.');
		return;
	}
	let isay = '<p class="triangle-border right">' + _isay + '</p>';

	$('#said').append(isay);
	$('#txt_isay').val();
	ajax_process(_isay);					// 입력된 값을 뿌려주고 받아온다.
}	
	
function ajax_process(_isay) {	
	$.ajax({							//	ajax식으로 : 	xhr.open('GET', url, true)
		type :'POST',								
		url  :'watsonsay',							
		data : {'isay':_isay},			// 	
		async: true,	//HttpRequest로 보냄 / true 여야지 비동기.
		success : function(data) {					
			let watsonsay =
				'<img src="<c:url value="/resources/img/chatbot.jpg"/>" width="100"/>' + 
				'<p class="triangle-border left" >' +		//  왼쪽삼각형으로 표시됨.
				data.output.text +'</br>' +'</br>';
							//		alert(data.output.text); -- 결과물 받아오는 거 뜨는지 확인하는 식.					
			if (_isay ==='') {
				watsonsay +='<img src="<c:url value="/resources/img/chatbot.jpg"/>" width="100"/>';
			}
			watsonsay += '</p>';
			$('#said').append(watsonsay); // 왓슨이 말하는 걸 붙이고.
							// 		대화가 많아지면, 브라우저 상에서 볼 수 없으니까.				// 높이 만들어주는 것 // 딜레이 5초 정도,
			$('html, body').animate({scrolltop:$(document).height()}, 500);
		}
});
}
</script>
<body>
<div id="said"></div>
<button type="button" id="btn_restart" class="btn btn-default"> 다시 대화하기 </button>
 		<input id="txt_isay" class="triangle-border center"/>
<button type="button" id="btn_isay" class="btn btn-default"> say </button>
									<!--  css 파일로 형식 바꿔줌, -->
</body>
</html>
<!-- 
	$.ajax({							//	ajax식으로 : 	xhr.open('GET', url, true)
		type :'POST',								
		url  :'watsonsay',							
		data : {'isay': $('#txt_isay').val() },		
//		async: false,	//HttpRequest로 보냄 / true 여야지 비동기.
		success : function(data) {					
			let watsonsay =
				'<p class="triangle-border left">' +		//  왼쪽삼각형으로 표시됨.
				data.output.text + '</p>';
//		alert(data.output.text); -- 결과물 받아오는 거 뜨는지 확인하는 식.					
			$('#said').append(watsonsay); // 왓슨이 말하는 걸 붙이고.
			// 대화가 많아지면, 브라우저 상에서 볼 수 없으니까.				// 높이 만들어주는 것 // 딜레이 5초 정도,
			$('html, body').animate({scrolltop:$(document).height()}, 500);
		}
});
 -->
