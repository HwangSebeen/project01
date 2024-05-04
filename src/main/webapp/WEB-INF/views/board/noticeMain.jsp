<!-- 공지사항 메인 페이지(리스트) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
</head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link href="<%= request.getContextPath() %>/resources/css/common.css" rel="stylesheet">
<style>  
.no {
  width: 7%;
  text-align: center;
}

.notice_title {
  width: 83%;
  text-align: center;
}

.dte {
  width: 25%;
  text-align: center;
}
</style>
<script type="text/javascript">
	function fn_gotoEnroll() {
		 window.location.href = "/board/noticeEnrollMain";
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
              <h3 style="font-size: 24px;">공지사항</h3>
          </div>
          <hr style="width: 990px;">
          <div>
            <table>
              <thead>
                <tr>
                  <th class="no">번호</th>
                  <th class="notice_title">제목</th>
                  <th class="dte">작성일</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${list}" var="list">
		            <tr>
		                <td class="no"><c:out value="${list.BBS_NO}"/></td>
		                <td class="notice_title">
		                	<a class="move" href='/board/noticeDetailMain?no=<c:out value="${list.BBS_NO}"/>'>
		                		<c:out value="${list.BBS_TITLE}"/>
		                	</a>
		                </td>
		                <td class="dte"><c:out value="${list.BBS_INS_DT}"/></td>
		            </tr>
		        </c:forEach>
              </tbody>
            </table>
          </div>
      </div>
     	<% if(String.valueOf(userId).equals("admin")){%>
			<div><!-- button area -->
	     		<button onclick="fn_gotoEnroll()">작성</button>
	     	</div>
		<%}%>
     	
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>