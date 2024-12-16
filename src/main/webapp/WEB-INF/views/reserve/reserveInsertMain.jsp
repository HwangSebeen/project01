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

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<%
	String userId = (String)session.getAttribute("userId");
	String userNm = (String)session.getAttribute("userNm");
%>
<script>

$(document).ready(function(){
	
	var userId = '<%=userId%>'; /*세션값*/
	// 로그인 안되어있으면 막기
	if(userId == 'null'){
		alert("로그인 후 이용바랍니다.");
		location.href='<c:out value="${pageContext.request.contextPath}"/>/';
	}
	
});

</script>
<title>예약하기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
		<nav class="snb"></nav>
		<div class="contents">
			<div class="inner">
				<div>
					<h3 style="font-size: 24px;">예약하기</h3>
				</div>
				<hr style="width: 700px; padding-right: 130px;">
				<div id='calendar'></div>
				<!--  fullCalendar 라이브러리 영역 -->
			</div>
		</div>
	</div>
	<!--  모달 팝업 영역 START -->
	
	<!-- 모달영역 END -->
	<form name="form1" id="form1" method="post" action="${ contextPath }/reserve/reserveInsertP">
		<input type="hidden" name="resvStDte" id="resvStDte" value="">
		<input type="hidden" name="resvEdDte" id="resvEdDte">
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		// 팝업 오픈
		function fn_openPopup(info){
			
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var todayString = year + '-' + month  + '-' + day;
			
			if(info.dateStr < todayString || info.startStr < todayString || info.endStr < todayString){
				alert(todayString + " 이전은 예약이 불가능합니다.");
				return;
			}
		
			var stDte = "";
			
			if(info.endStr == null){
				stDte = info.dateStr
			} else {
				stDte = info.startStr;
			}
			var date = new Date(info.endStr);
			
			var year1 = date.getFullYear();
			var month1 = ('0' + (date.getMonth() + 1)).slice(-2);
			var day1 = ('0' + date.getDate()).slice(-2)-1;
			
			// 종료일자
			$("#resvEdDte").val(year1 + "-" + month1 + "-" + day1);
			// 시작일자
			$("#resvStDte").val(stDte);
			
			var url = "<%=request.getContextPath()%>/reserve/reserveInsertP";
	        
	        var wWidth =500; 
		    var wHight = 500;
		 
		    var wX = (document.documentElement.clientWidth - wWidth) / 2;
		    var wY = (document.documentElement.clientHeight - wHight) / 2;
	        
	        var option = "width=" +wWidth + ', height=' + wHight + ', top=' +wY+ ', left='+ wX + ", location = no";

			var windowTargetName = "targetName";
			window.open(url, windowTargetName, option);
			
			// 2.POST로 데이터 전달
			document.form1.action="/reserve/reserveInsertP"; // 이동
			document.form1.target=windowTargetName;
			$("#form1").submit();
		}
		
// 		$(function () {
//                var request = $.ajax({
//                    url: "/reserve/selectReserveList", // 변경하기
//                    method: "GET",
//                    dataType: "json"
//            });
// 		request.done(function (data) {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko' // 한국어 설정
		
		, dateClick: function(info) { //일자 셀 클릭 함수
			
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var todayString = year + '-' + month  + '-' + day;
			
			if(info.dateStr < todayString || info.startStr < todayString || info.endStr < todayString){
				return;
			}
			
			fn_openPopup(info);
		}
		, select : function(info){	 // 드래그했을경우
			var date = new Date(info.endStr);
			
			var year = date.getFullYear();
			var month = ('0' + (date.getMonth() + 1)).slice(-2);
			var day = ('0' + date.getDate()).slice(-2)-1;
			
			var rslt = year + '-' + month  + '-' + day;
			
			if(rslt == info.startStr){
			} else {
				fn_openPopup(info);
				return;
			}
		}
		, events: [
					     { title: 'Click for Google',
					       start: '2024-12-28'
					      }
					  ]
// 			, events: data

			});
		calendar.render();
	});
// 			});
</script>
</html>