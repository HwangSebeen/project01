<!-- 공지사항 메인 페이지(리스트) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<title>메뉴관리</title>
</head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link href="<%= request.getContextPath() %>/resources/css/common.css" rel="stylesheet">
<style>  
.no {
  width: 9%;
  text-align: center;
}

.notice_title {
  width: 50%;
  text-align: center;
}

.dte { 
  width: 50%;
  text-align: center;
}
</style>
<script type="text/javascript">
function fn_gotoEnroll() {
	 window.location.href = "/admin/menu/menuInsertMain";
}
</script>
<body>
<%
	String userId = (String)session.getAttribute("userId");
	String userNm = (String)session.getAttribute("userNm");
%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div id="container">
  <div class="contents">
      <div class="inner">
          <div>
              <h3 style="font-size: 24px;">메뉴관리</h3>
          </div>
          <hr style="width: 990px;">
          <div>
            <table>
              <thead>
                <tr>
                  <th class="no">메뉴이미지</th>
                  <th class="notice_title">카테고리</th>
                  <th class="dte">메뉴명</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${list}" var="list">
		            <tr>
		                <td class="no"><img src="${list.FILE_STOR_PATH}" style="width : 300px; height:300px; "></td>
		                
		                <td class="notice_title">
		                	<a class="move" href='/admin/menu/menuDetail?no=<c:out value="${list.MENU_NO}"/>'>
		                		<c:out value="${list.CATEGORY}"/>
		                	</a>
		                </td>
		                <td class="dte">
			                <a class="move" href='/admin/menu/menuDetailMain?no=<c:out value="${list.MENU_NO}"/>'>
			                	<c:out value="${list.MENU_KOR_NM}"/>
			                </a>
		                </td>
		            </tr>
		        </c:forEach>
              </tbody>
            </table>
          </div>
      </div>
     	<% if(String.valueOf(userId).equals("admin")){%>
			<div><!-- button area -->
	     		<button onclick="fn_gotoEnroll()">메뉴 추가(등록)</button>
	     	</div>
		<%}%>
     	
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>