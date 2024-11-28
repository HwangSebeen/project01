<!-- 공지사항 상세 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
</head>
<meta charset="UTF-8">
<link href="<%= request.getContextPath() %>/resources/css/common.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<style>
.div_content_login {
	text-align: center;
    margin: 0 auto;
}
</style>
<script>

	function fn_enterkey() {
	  if (window.event.keyCode == 13) {
	       fn_login();
	  }
	}
	
	function fn_gotoJoin() {
		 window.location.href = "/login/join";
	}
	
	// 로그인
	function fn_login(){
		var id = $('#userId').val();
		var pwd = $('#userPwd').val();
		
		if(id == ""){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(pwd == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		$.ajax({
            type: "POST" ,
            url: "/login/login.do",
            contentType: "application/x-www-form-urlencoded", //"charset=UTF-8",
            data : { userId : id, userPwd : pwd }, 
            dataType: 'json',
            success: function (data) {
            	if(data.failYn == "fail"){
            		alert("등록된 정보가 없습니다.");
            		window.location.href = "/login/loginMain";
            	} else if(data.failYn == "success" && data.USERLEAVEYN == "Y") {
            		alert("탈퇴된 회원입니다.");
            		window.location.href = "/login/loginMain";
            	} else if((data.failYn == "success") && (data.CHKID == "N" || data.CHKPWD == "N")){
            		alert("정보가 일치하지 않습니다.");
            		window.location.href = "/login/loginMain";
            	} else if(data.failYn == "success" && data.CHKPWD == "Y" && data.CHKID == "Y") {
            		alert("로그인되었습니다.");
            		window.location.href = "/";
            	}
            },
            error: function (request, status, error) {
            	alert("code: " + request.status)
                alert("message: " + request.responseText)
                alert("error: " + error);
            }
        });
	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
	  <div class="contents">
	      <div class="inner">
	          <div>
	              <h3 style="font-size: 24px;">로그인</h3>
	          </div>
	          <hr style="width: 990px;">
	          <div >
<!-- 		      <form id="frm"> -->
						<table class="table table-bordered table-hover div_content_login"	style="text-align: center; border: 1px solid #ddddddd">
					<thead>
						<tr>
							<th colspan="2"><h2>로그인</h2></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 110px;"><h5>아이디</h5></td>
							<td><input class="form-control" type="text" id="userId" name="userId"
								maxlength="20" placeholder="아이디를 입력하세요."></td>
						</tr>
						<tr>
							<td style="width: 110px;"><h5>비밀번호</h5></td>
							<td><input class="form-control" type="password" id="userPwd" onkeyup="fn_enterkey()"
								name="userPwd" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
						</tr>
				
						<tr>
							<td style="text-align: left" colspan="2">
								<button onclick="fn_login()">로그인</button>
							</td>
							<td>
								<button onclick="fn_gotoJoin()">회원가입</button>
							</td>
						</tr>
					</tbody>
				</table>
<!-- 				</form> -->
	          </div>
	      </div>
	  </div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</body>
</html>