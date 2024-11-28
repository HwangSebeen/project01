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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/common.css" rel="stylesheet">
<script>
// 메뉴매인으로 이동
function fn_gotoMain() {
	 window.location.href = "/admin/menu/menuMain"; 
}

// 저장로직
function fn_save(){
	
	console.log("111");
	$("#frm_insert").attr('action', "<c:url value = '/admin/menu/menuInsert'/>");
	$("#frm_insert").attr('method', "post");
	
	$("#frm_insert").submit();
}

// 이미지 미리보기
function setThumbnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		img.setAttribute("width", "300px");
		img.setAttribute("height", "300px");
		document.querySelector("div#image_container").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}
</script>
<title>예약하기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div id="container">
  	<div class="contents">
    <div class="inner">
        <div>
            <h3 style="font-size: 24px;">메뉴등록</h3>
        </div>
        <hr style="width: 990px;">
<!--         <form id="frm_insert" onsubmit="return fn_validation()" enctype="multipart/form-data"> -->
         <form id="frm_insert" enctype="multipart/form-data">
            <table class=""
                style="text-align: center; border: 1px solid #ddddddd">
                <thead>
                    <tr>
                        <th colspan="3"><h4>메뉴등록</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 110px; height:350px;"><h5>메뉴이미지</h5></td>
                        <td class="2">
                            <div id="image_container" style="border : 1px solid black; width : 300px; height:300px; ">
                            <!-- 이미지영역 -->
                            </div>
                            <input style="margin-top:10px;" class="form-control form-control-user" type="file" name="menuImg" id="menuImg" onchange="setThumbnail(event);">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>메뉴명(한글)</h5></td>
                        <td class="2">
                            <input class="" id="menuKorNm" type="text" name="menuKorNm" maxlength="50" placeholder="메뉴명을 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>메뉴(영문명)</h5></td>
                        <td class="2">
                            <input class="" id="menuEngNm" type="text" name="menuEngNm" maxlength="50" placeholder="메뉴명을 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;">
                            <h5>카테고리</h5>
                        </td>
                        <td style="text-align: left;">
                        	<select name="category" id="category" style="margin-left:65px;"> <!--  공통코드로 관리 -->
                                <option value="01">음료</option>
                                <option value="02">디저트</option>
                                <option value="03">MD</option>
                                <option value="04">기타</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>가격</h5></td>
                        <td class="2">
                            <input class="" id="origAmt" type="number" name="origAmt" maxlength="20" placeholder="가격을 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>판매가격</h5></td>
                        <td class="2">
                            <input class="" id="saleAmt" type="number" name="saleAmt" maxlength="20" placeholder="판매가격을 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>메뉴설명</h5></td>
                        <td class="2">
                            <input class="" id="menuDtl" type="text" name="menuDtl" maxlength="20" placeholder="메뉴설명을 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>옵션</h5></td>
                        <td><input class="" id="menuOpt" type="text"
                            name="menuOpt" maxlength="20" placeholder="입력하세요."></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <div>
	        <button onclick="fn_save()">저장</button>
	       	<button onclick="fn_gotoMain()">목록</button>
      	</div>
    </div>
  </div>
  </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>