<!-- 공지사항 메인 페이지(리스트) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자페이지 메인</title>
</head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link href="<%= request.getContextPath() %>/resources/css/common.css" rel="stylesheet">
<style>  

</style>
<script type="text/javascript">
	
</script>
<body>
<%
	String userId = (String)session.getAttribute("userId");
	String userNm = (String)session.getAttribute("userNm");
%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div id="container">
 <nav class="snb">
           <div class="snb_inner">
           		<jsp:include page="/WEB-INF/views/common/submenu.jsp"/>
           </div>
 </nav>
  <div class="contents_admin_mypage">
      <div class="inner_admin_mypage">
          <div>
              <h3 style="font-size: 24px;">관리자페이지 메인</h3>
          </div>
          <hr style="width: 920px;">
          
      </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>