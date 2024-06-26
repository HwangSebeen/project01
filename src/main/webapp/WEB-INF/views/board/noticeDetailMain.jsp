<!-- 공지사항 상세 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
</head>
<meta charset="UTF-8">
<link href="<%= request.getContextPath() %>/resources/css/common.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
<style>
.bbs_common {
	margin-top : 10px;
	margin-bottom : 10px;
	width : 900px;
	height : 30px;
	margin-left : 50px;
}
.bbs_crtr {
	margin-left : 50px;
}
</style>
<script>
	function fn_gotoList() {
		 window.location.href = "/board/noticeMain"; 
	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div id="container">
  <div class="contents">
      <div class="inner" style="height:1300px;">
          <div>
              <h3 style="font-size: 24px;">공지사항</h3>
          </div>
          <hr style="width: 990px;"> 
          <div>
            <label class="bbs_crtr">작성일</label><br>
            <input class="bbs_common" id="datepicker" readonly="readonly" name="BBS_CONTENT" value='<c:out value="${list.BBS_INS_DT}"/>'><br>
            <label class="bbs_crtr">제목</label><br>
            <input class="bbs_common" name="BBS_TITLE" readonly="readonly" value='<c:out value="${list.BBS_TITLE}"/>' >
            <br>
            <label class="bbs_crtr">내용</label><br>
            <div id="classic" class="bbs_common">
            	<textarea id="bbsContent" name="bbsContent"><c:out value="${list.BBS_CONTENT}"/></textarea>
            	<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
					CKEDITOR.replace('bbsContent',
					{filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do',
						  width:'900px',
					      height:'700px',
					      toolbarCanCollapse : true, 
						  toolbarStartupExpanded : false
					});
				</script>
            	<div><!-- button area -->
		     		<button onclick="fn_gotoList()">목록</button>
		     	</div>
            </div>
          </div>
          
      </div>
     	
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</body>
</html>