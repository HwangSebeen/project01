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
        <form method="post" id="frm_insert" onsubmit="return fn_validation()" action="">
            <table class=""
                style="text-align: center; border: 1px solid #ddddddd">
                <thead>
                    <tr>
                        <th colspan="3"><h4>메뉴등록</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 110px;"><h5>메뉴이미지</h5></td>
                        <td>
                            <div style="border : 1px solid black; width : 50px; height:50px;">
                            <!-- 이미지영역 -->
                            </div>
                            <button onclick="">첨부</button>
                        <td style="width: 110px;">
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
                        	<select name="category" id="category"> <!--  공통코드로 관리 -->
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
                            <input class="" id="originPrice" type="number" name="originPrice" maxlength="20" placeholder="가격을 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>판매가격</h5></td>
                        <td class="2">
                            <input class="" id="salePrice" type="number" name="salePrice" maxlength="20" placeholder="판매가격을 입력하세요.">
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