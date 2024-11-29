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
<title>메뉴 옵션 관리</title>
<style>
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

<script language="JavaScript">
	$(document).ready(function(){
		selectMenuOptList();
	});
	
	// 기존 옵션 목록 가져오기
	function selectMenuOptList() {
		
	}
	
	// 옵션 저장
	
</script>

</head>
<body>
     <div class="allWrapper">
        <div id="">
            <h3>메뉴 옵션 관리</h3>
            <div class="resetForm_body">
                <h4>옵션 목록</h4>
                <div class="optListArea">        	
                    <table id="example-table-1" width="100%" class="table table-bordered table-hover text-center">
					<thead>
						<tr>
							<th>옵션번호</th>
							<th>옵션명</th>
							<th>옵션가격</th>
						</tr>
					</thead>
					<tbody>				
						<tr>
							<td>1</td>
							<td>user01</td>
							<td>홍길동</td>
						</tr>
					</tbody>
				</table>
                </div>
                <div class="optDtlArea"> <!-- 등록/수정 영역 -->
                	<table class="table table-bordered table-hover div_content_login"	style="text-align: center; border: 1px solid #ddddddd">
					<thead>
						<tr>
							<th colspan="2"><h3>옵션</h2></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 110px;">옵션번호</td>
							<td><input class="form-control" type="text" id="optNo" name="optNo" readonly style="background-color: lightgray;"
								maxlength="20"></td>
						</tr>
						<tr>
							<td style="width: 110px;">옵션명</td>
							<td><input class="form-control" type="text" id="optNm" 
								name="optNm" maxlength="20"></td>
						</tr>
                        <tr>
							<td style="width: 110px;">옵션 가격</td>
							<td><input class="form-control" type="number" id="optAmt"
								name="optAmt" maxlength="20"></td>
						</tr>
					</tbody>
				</table>
                </div>
                <div class="btnArea">
                    <button type="button" class="commBtn" onclick="cancelBtn();" value="">취소</button>
                    <button type="button" id="btn_save" class="commBtn" value="">등록</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>