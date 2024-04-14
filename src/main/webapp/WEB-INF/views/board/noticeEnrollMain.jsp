<!-- 공지사항 등록 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<link href="<%= request.getContextPath() %>/resources/css/common.css" rel="stylesheet">
<style>
	.ck.ck-editor {
    	max-width: 900px;
    	margin-top : 10px;
    	margin-left : 50px;
	}
	.ck-editor__editable {
	    min-height: 800px;
	}
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
	function fn_gotoMain() {
		 window.location.href = "/board/noticeMain"; 
	}
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <div id="container">
	  <div class="contents">
	      <div class="inner">
	          <div>
	              <h3 style="font-size: 24px;">공지사항</h3>
	          </div>
	          <hr style="width: 990px;">
	          <div>
	            <form>
	                <label class="bbs_crtr">작성일</label><br>
	                <input name="bbsInsDte" class="bbs_common"><br>
	                <label class="bbs_crtr">제목</label><br>
	                <input name="bbsTitle" class="bbs_common"><br>
	                <label class="bbs_crtr">내용</label><br>
	                <div id="classic">
				        <p></p>
				    </div>
				    <script>
				        ClassicEditor
				            .create( document.querySelector( '#classic' ))
				            .catch( error => {
				                console.error( error );
				            } );
				    </script>
	            </form>
	            <div><!-- button area -->
	            	<button>저장</button>
	            	<button onclick="fn_gotoMain()">목록</button>
	            </div>
	         </div>
	      </div>
	  </div>
  </div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>