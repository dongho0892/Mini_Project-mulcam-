<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap start -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> page title </title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.3.1.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<!-- bootstrap end -->
<link href="<c:url value="/resources/css/bubbles.css" />" rel="stylesheet">

<script type="text/javascript">
$(document).ready(function(){
   $('#btn_restart').click(function(){
      let re = confirm('모든 내용이 초기화됩니다. \n 정말 재시작 할까요?');
      if(re){         
         $('#said').html('');
         ajax_process('');         
      }
   });
   
   $('#txt_isay').keypress(function(e){
      if(e.which==13){
         conversation();
      }
   });
   
   $('#btn_isay').click(function(e){
      conversation();
   });
   ajax_process('');
});

function conversation(){
   let _isay = $.trim($('#txt_isay').val());
   if(_isay==''){
      alert('내용을 입력하세요');
      return;
   }
   let isay ='<div class="row" col="5">';
   
      isay += '<p class="col-lg-3 col-sm-3"/>'
      //triangle-border right
      isay += '<p class="triangle-isosceles right col-lg-3 col-sm-3">'+
      '<font size="3">'+_isay+'</font>'
            +'</p>';         
      isay +='<img class="col-lg-2 col-sm-2"  '+
            ' src="<c:url value="/resources/img/Untitled-2.jpg" />" width="100"/>';      
      isay +='</div>';         
   $('#said').append(isay);
   $('#txt_isay').val('');
   ajax_process(_isay);
}

function ajax_process(_isay){
   $.ajax({//값 받아오기, 여기서 json 매핑을 실행해서 리턴받아야 한다.
      type:'POST',
      url:'watsonsay',
      data:{'isay':_isay},
      async:true,//비동기: 거짓, 즉 저거는 동기다.
      success:function(data){
         let watsonsay='<div class="row">';   
            //watsonsay += '<p class="col-lg-1"/>';
            watsonsay += '<img class="col-lg-2 col-sm-2"'+
            ' src="<c:url value="/resources/img/chatbot.jpg" />" width="100"/>';
            watsonsay +=  
               //'<div class="col-lg-6">'+
               '<p class="triangle-isosceles left col-lg-3 col-sm-3">'+
               '<font size="3">'+'<br>';

               console.log('context  :   '+data.tax);
               console.log('abcd.context  :   '+data.context.abcd);
               console.log('abcd  :   '+data.abcd);
               
 	  	     if(data.context.abcd == 1) {
//			 if(data.tax != undefined){
           	 watsonsay += '<br>'+'결과는 '+data.tax+' 만원으로 확인되었습니다.'; 
               };
             watsonsay +=data.output.text;       
/*               '<font size="3">'+'<br>'+data.output.text;

               console.log('context  :   '+data.tax);
               console.log('abcd.context  :   '+data.context.abcd);
               console.log('abcd  :   '+data.abcd);
               
 	  	     if(data.context.abcd == 1) {
//			 if(data.tax != undefined){
           	 watsonsay += '<br>'+'결과는 '+data.tax+' 만원으로 확인되었습니다.'; 
               };
*/               
                 watsonsay += '</font>'+'</p>';
               //+'</div>';
            watsonsay += '</div>';   
            watsonsay = watsonsay.replace(/__/g,"<br/>")
         $('#said').append(watsonsay);
         $('html, body').animate({scrollerTop:$(document).height()},500);
         
         if(data.context.req=='list'){
            ajax_process_getList(data);
         }else if(data.context.req=='info'){
            ajax_process_getInfo(data.context.Name);
         }
            //html body에서 현재 문서의 스크롤의 top는 문서의 높이만큼이다
            //내려가는 시간은 0.5초이다.
      }
   });//ajax 괄호 끝   
}

      
      
</script>
</head>
<body>
<div class="container">
<div id="said" class="jumbotron"></div>
<input type="text" id="txt_isay" class="triangle-border center col-lg-9" autofocus="autofocus"/>
<button type="button" id="btn_isay" class="btn btn-default col-lg-1">say</button>
<button type="button" id="btn_restart" class="btn btn-default">대화 재시작</button>
</div>
</body>
</html>