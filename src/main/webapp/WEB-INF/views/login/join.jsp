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
</style>
<script>
	// 페이지 로드 시 지점 가져오기
	$(document).ready(function(){
		
		fn_selectOfficeList();
	});
	
	// 관리지점목록 조회 ajax
	function fn_selectOfficeList(){
		$("#userOfficeNo").empty();
		
		$.ajax({
            type: "POST" ,
            url: "/login/selectOfficeList.do",
            contentType: "application/json; charset=UTF-8",
            dataType: 'json',
            success: function (result) {
            	
                $("#userOfficeNo").append('<option value="">-선택-</option>');
                var laborOption = "";
                for(var k in result){
           			var OFFICE_NO = result[k].OFFICE_NO;
            	    var OFFICE_NM = result[k].OFFICE_NM;
           			laborOption = '<option value="' + OFFICE_NO + '">' + OFFICE_NM + '</option>';
           	
           	          $('#userOfficeNo').append(laborOption); 
           	      }
            },
            error:function(){
            	alert("관리지점을 불러오지 못했습니다.");
            }
        });
	}
	
	// 저장 전 유효성체크
	function fn_validation(){
		
		if($('#userId').val() == ""){
			alert("아이디를 입력하세요.");
			$('#userId').focus();
			return false;
		}
		
		if($("#userId").is(":disabled") == false){
			alert("아이디 중복체크를 해주세요.");
			$('#userId').focus();
			return false;
		}
		
		if($('#userPwd').val() == ""){
			alert("비밀번호를 입력하세요.");
			$('#userPwd').focus();
			return false;
		}
		
		if($('#userPwd2').val() == ""){
			alert("비밀번호를 입력하세요.");
			$('#userPwd2').focus();
			return false;
		}
		
		if($('#chkPwd').text() == "비밀번호 불일치"){
			alert("비밀번호가 일치하지 않습니다. 비밀번호를 재입력하세요.");
			$('#userPwd2').focus();
			return false;
		}
		
		if($('#userNm').val() == ""){
			alert("이름을 입력하세요.");
			$('#userNm').focus();
			return false;
		}
		
		if($('#userCellPhone1').val() == "" || $('#userCellPhone2').val() == "" || $('#userCellPhone3').val() == ""){
			alert("전화번호를 입력하세요.");
			$('#userCellPhone1').focus();
			return false;
		}
		
		if($("#zipcode").val() != "" && $("#address1").val() != ""){
			alert("상세주소를 입력하세요.");
			$('#address2').focus();
		}
		
		return true;
	}
	
	function fn_chkId(){
		var userId = $('#userId').val();
		console.log("userId : " + userId);debugger;
		$.ajax({
            type: "POST",
            url: "/login/checkDupUserId.do",
//             contentType: "application/json; charset=UTF-8",
//             dataType: 'json',
			data : {"userId":userId},
            success: function (result) {
            	if(Number(result) > 0){
            		alert("이미 사용중인 아이디입니다. 다시 입력해주세요.");
            		$('#userId').val("");
            	} else {
            		alert("사용가능한 아이디입니다.");
            		$('#userId').attr("disabled", true);
            	}
            },
            error:function(){
            	alert("[시스템 에러]관리자에게 문의해주세요.");
            }
        });
	}
	
	// 주소검색이벤트
	function zipCheck(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                
	                if(data.roadAddress == ""){
	                	roadAddr = data.jibunAddress;	// 지번주소
	                }
	                
	                $("#zipcode").val(data.zonecode);
	                $("#address1").val(roadAddr);
	                
	            }
	        }).open();
	}
	
	function fn_chkPwd(){
		if($('#userPwd').val() == $('#userPwd2').val()){
	        $('#chkPwd').text('비밀번호 일치').css('color', 'green');
	    }else{
	        $('#chkPwd').text('비밀번호 불일치').css('color', 'red');
	    }
	}
	
	function fn_focusOutPwd() {
		if($('#chkPwd').text() == "비밀번호 불일치"){
			$('#userPwd').attr("disabled", false);
	        $('#userPwd2').attr("disabled", false);
		} else {
			 $('#userPwd').attr("disabled", true);
		     $('#userPwd2').attr("disabled", true);
		}
	}
</script>
<title>회원가입</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="container">
		<nav class="snb"></nav>
		<div class="contents">
			<div class="inner">
				<div>
					<h3 style="font-size: 24px;">회원가입</h3>
				</div>
				<hr style="width: 700px; padding-right: 130px;">
				<form method="post" id="frm_join" onsubmit="return fn_validation()" action="${ contextPath }/login/join">
					<table class=""
						style="text-align: center; border: 1px solid #ddddddd">
						<thead>
							<tr>
								<th colspan="3"><h4>회원등록양식</h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 110px;"><h5>아이디</h5></td>
								<td><input class="" type="text" id="userId"
									name="userId" maxlength="20" placeholder="아이디를 입력하세요.">
								<td style="width: 110px;"><button class="" onClick="fn_chkId()" type="button">중복체크</button>
								</td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>비밀번호</h5></td>
								<td class="2">
									<input class="" id="userPwd" type="password" name="userPwd1" maxlength="20" placeholder="비밀번호를 입력하세요.">
								</td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>비밀번호 확인</h5></td>
								<td class="2">
									<input onfocusout="fn_focusOutPwd()" oninput="fn_chkPwd()" class="" id="userPwd2" type="password"
									name="userPwd2" maxlength="20"	placeholder="비밀번호확인란를 입력하세요.">
									<span id="chkPwd"></span>
								</td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>이름</h5></td>
								<td class="2">
									<input class="" id="userNm" type="text" name="userNm" maxlength="20" placeholder="이름를 입력하세요.">
								</td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>생년월일</h5></td>
								<td class="2">
									<input type="date" id="userBrth" name="userBrth">
								</td>
							</tr>
							<tr>
								<td style="width: 110px;">
									<h5>전화번호</h5>
								</td>
								<td style="text-align: left;"><select name="userCellPhone1" id="userCellPhone1">
										<option value="02">02</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> - <input type="text" name="userCellPhone2" size="8" id="userCellPhone2" /> - <input
									type="text" name="userCellPhone3" size="8" id="userCellPhone3" /></td>
							</tr>
			
							<tr>
								<td style="width: 110px;"><h5>성별</h5></td>
								<td colspan="2">
									<div class="form-group"
										style="text-align: center; margin: 0 auto;">
										<div class="btn-group" data-toggle="buttons">
											<label class=""> 
												<input	type="radio" name="userGender" autocomplete="off" value="M" checked>남자
											</label> 
											<label class=""> 
												<input type="radio"	name="userGender" autocomplete="off" value="W">여자
											</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>관리 지점</h5></td>
								<td>
									<select name="userOfficeNo" id="userOfficeNo"></select>
								</td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>이메일</h5></td>
								<td><input class="" id="userEmail" type="text"
									name="userEmail" maxlength="20" placeholder="이메일를 입력하세요."></td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>우편번호</h5></td>
								<td><input class="" id="zipcode" type="text"
									name="zipcode" disabled="true"/>
								<td style="width: 110px;"><button class=""
										onClick="zipCheck()" type="button">찾기</button></td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>주소1</h5></td>
								<td><input class="" id="address1" type="text"
									name="address1" size="50" placeholder="주소를 입력하세요."></td>
							</tr>
							<tr>
								<td style="width: 110px;"><h5>주소2</h5></td>
								<td><input class="" id="address2" type="text"
									name="address2" size="30" placeholder="상세주소를 입력하세요."></td>
							</tr>
							<tr>
								<td style="text-align: left;" colspan="3"> 
									<input class="" type="submit" value="회원가입">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>