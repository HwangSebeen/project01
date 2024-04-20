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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
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
	
	function fn_save(){
		var dte = $('#datepicker').val().replaceAll('-','');
		$('#fmtBbsInsDte').val(dte);
		$('#fmtBbsLstDte').val(dte);
		
		$("#frm").attr('action', "<c:url value = '/board/boardEnroll'/>");
		$("#frm").attr('method', "post");
		
		$("#frm").submit();
	}
	
	$(function(){
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
	
        
		
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
	            <form id="frm">
	            	<input type="hidden" name="bbsTyp" value="02">
	            	<!-- <input type="hidden" name="bbsContent" id="edt_bbsContent" value=""> -->
	            	<input type="hidden" name="bbsInsDte" id="fmtBbsInsDte" value="">
	            	<input type="hidden" name="bbsLstDte" id="fmtBbsLstDte" value="">
	            	<input type="hidden" name="docId" id="docId" value="">
	            	<input type="hidden" name="delYn" id="delYn" value="N">
	            	<input type="hidden" name="userId" id="userId" value="admin">
	            	
	                <label class="bbs_crtr">작성일</label><br>
	                <input class="bbs_common" id="datepicker"><br>
	                <label class="bbs_crtr">제목</label><br>
	                <input name="bbsTitle" class="bbs_common"><br>
	                <label class="bbs_crtr">내용</label><br>
	                <div id="classic">
<!-- 				        <input type="text" name="bbsContent" id="bbsContent"> -->
						<textarea id="bbsContent" name="bbsContent"></textarea>
				    </div>
				    <script>
				        ClassicEditor
				            .create( document.querySelector( '#bbsContent' ))
				            .catch( error => {
				                console.error( error );
				            } );
				    </script>
	            </form>
	            <div><!-- button area -->
	            	<button onclick="fn_save()">저장</button>
	            	<button onclick="fn_gotoMain()">목록</button>
	            </div>
	         </div>
	      </div>
	  </div>
  </div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>