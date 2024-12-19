<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
* {
 font-family: "IBM Plex Sans KR", sans-serif;
  font-weight: 400;
  font-style: normal;
}
#container {
	width: 1100px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	flex-wrap: nowrap;
	border: 1px solid red;
	height: 1400px;
}

.snb {
	width: 200px;
	/* height: 2500px; */
	height: 100%;
	border: 1px solid blue;
}

.contents {
	width: 888px;
	height: 100%;
	/*2500px -> 100%*/
	border: 1px solid black;
}

.inner {
	margin-top: 30px;
	margin-left: 27px;
	width: 836px;
	/* height: 100%; */
	border: 1px solid yellow;
}

a {
	text-decoration: none;
	color: #000;
}

.snb {
	width: 210px;
}

.snb_inner {
	width: 170px; 
	margin: 30px auto 0;
}
.modal {
    position: fixed;
     top: 0; 
    left: 0; 
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: scroll;
}

.modal .bg {
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
}

.modalBox {
    position: absolute;
    background-color: #fff;
    width: 500px;
    height: 500px;
    padding: 15px;
    overflow: scroll;
    top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
}

.hidden {
    display: none;
}

.optListArea {
    width: 300px;
}
.allWrapper {
    text-align: center;

    display: flex;
  justify-content: center;
  align-items: center;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="<%= request.getContextPath() %>/resources/js/common.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<%
	String userId = (String)session.getAttribute("userId");
	String userNm = (String)session.getAttribute("userNm");
%>

<%
    String resvStDte = request.getParameter("resvStDte");
	String resvEdDte = request.getParameter("resvEdDte");
%>
<script>

$(document).ready(function(){
	$("#btn_close").click(function() {
		window.close();
	});
	
	fn_selectOfficeList("userOfficeNo");
	
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var todayString = year + '-' + month  + '-' + day;
	
	$("#resvDte").val(todayString);
	$("#resvStDte").val("<%=resvStDte %>");
	$("#resvEdDte").val("<%=resvEdDte %>");
	
});

function inputTimeColon(time) {
var replaceTime = time.value.replace(/\:/g, "");        // 글자수가 4 ~ 5개 사이일때만 동작하게 고정한다.  
if(replaceTime.length >= 4 && replaceTime.length < 5) {            // 시간을 추출      
	 var hours = replaceTime.substring(0, 2);            // 분을 추출        
   		 var minute = replaceTime.substring(2, 4);            // 시간은 24:00를 넘길 수 없게 세팅        
   		 if(hours + minute > 2400) { 
        alert("시간은 24시를 넘길 수 없습니다.");
		time.value = "24:00";                return false;         
   		 }            // 분은 60분을 넘길 수 없게 세팅            
	if(minute > 60) {                
		alert("분은 60분을 넘길 수 없습니다.");               
		time.value = hours + ":00";               
		return false;           
	}            // 콜론을 넣어 시간을 완성하고 반환한다.      
	     time.value = hours + ":" + minute;      
}
}

</script>
<title>예약하기</title>
</head>
<body>
	<!--  모달 팝업 영역 START -->
	<div id="popup_area" class="modal">
		<div class="bg">
			<div class="modalBox qqq">
				<div class="allWrapper">
					<div>
						<div class="exit_area">
							<button id="btn_close">닫기</button>
						</div>
						<h3>예약 양식</h3>
						<div class="optForm_body">
							<form method="post" id="frm_join">
								<table class=""
									style="text-align: center; border: 1px solid #ddddddd">
									<tbody>
										<tr>
											<td style="width: 110px;"><h5>예약 신청 일시</h5></td>
											<td>
												<input class="" type="date" id="resvDte" name="resvDte" >
											</td>
										</tr>
										<tr>
											<td style="width: 110px;"><h5>예약 신청 일시</h5></td>
											<td>
												<input class="" type="date" id="resvDte" name="resvDte" >
											</td>
										</tr>
										<tr>
											<td style="width: 110px;"><h5>예약 날짜</h5></td>
											<td>
												시작일자 : <input class="" type="date" id="resvStDte" name="resvStDte" value=<%=resvStDte %>><br>
												종료일자 : <input class="" type="date" id="resvEdDte" name="resvEdDte" value=<%=resvEdDte %>>
											</td>
										</tr>
										<tr>
											<td style="width: 110px;"><h5>예약 시간</h5></td> 
											<td class="2">

												시작시간 : <input class="" id="resvStDte" type="text" name="resvStDte" onKeyup="inputTimeColon(this);" placeholder="숫자만 4자리 입력(24시간제)">
											<br>종료시간 : <input class="" id="resvEdDte" type="text" name="resvEdDte" onKeyup="inputTimeColon(this);" placeholder="숫자만 4자리 입력(24시간제)">


											</td>
										</tr>
										<tr>
											<td style="width: 110px;"><h5>예약자 성명</h5></td>
											<td class="2">
												<input class="" id="resvNm" type="text" name="resvNm" maxlength="20" value=<%=userNm %>>
												<input class="" id="userId" type="hidden" name="userId" maxlength="20" value=<%=userId %>>
											</td>
										</tr>
										<tr>
											<td style="width: 110px;"><h5>예약 주제</h5></td>
											<td class="2">
												<input class="" id="resvTitle" type="text" name="resvTitle" maxlength="20" placeholder="예약 주제를 입력하세요.">
											</td>
										</tr>
										<tr>
											<td style="width: 110px;"><h5>예약 내용</h5></td>
											<td class="2">
												<input type="text" id="resvContent" name="resvContent" placeholder="예약 내용을 입력하세요.">
											</td>
										</tr>
										<tr>
											<td style="width: 110px;">
												<h5>전화번호</h5>
											</td>
											<td style="text-align: left;"><select name="resvPhoneNum1" id="resvPhoneNum1">
													<option value="02">02</option>
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
											</select> - <input type="text" name="resvPhoneNum2" size="8" id="resvPhoneNum2" /> - <input
												type="text" name="resvPhoneNum3" size="8" id="resvPhoneNum3" /></td>
										</tr>
										<tr>
											<td style="width: 110px;"><h5>예약 지점</h5></td>
											<td>
												<select name="userOfficeNo" id="userOfficeNo"></select>
											</td>
										</tr>
										<tr>
											<td style="text-align: left;" colspan="3"> 
												<input class="" type="submit" value="예악 신청하기">
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
						</div>
					</div>
	
				</div>
			</div>
		</div>
</body>

</html>