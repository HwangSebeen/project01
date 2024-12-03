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
<style>
.modal {
    position: fixed;
     top: 0; 
    left: 0; 
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: scroll;
}

.modal .bg {
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
}

.modalBox {
    position: absolute;
    background-color: #fff;
    width: 500px;
    height: 400px;
    padding: 15px;
    overflow: scroll;
    top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
}

.hidden {
    display: none;
}

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
<script>
// 메뉴매인으로 이동
function fn_gotoMain() {
	 window.location.href = "/admin/menu/menuMain"; 
}

// 저장로직
function fn_save(){
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

$(document).ready(function() {
    $(".btn_open").click(function() {
    	// 기존 옵션 목록 가져오기
    	fn_selectOptList();
    	
        $("#popup_area").removeClass("hidden");
    });
    
    $("#btn_close, #btn_cancel").click(function() {
        $("#popup_area").addClass("hidden");
        
        $('#tbody_opt_list').empty(); 
    });
});

// 기존 옵션 목록 가져오기
function fn_selectOptList(){
	$.ajax({
        type: "POST" ,
        url: "/admin/menu/selectOptList.do",
        contentType: "application/json; charset=UTF-8",
        dataType: 'json',
        success: function (result) {
            var option = "";
            for(var i in result){
       			var OPT_NO = result[i].OPT_NO;
        	    var OPT_NM = result[i].OPT_NM;
        	    var OPT_AMT = result[i].OPT_AMT;
       			
        	    option = "<tr>"
        	    			+"<td>" + OPT_NO + "</td>"
        	    			+"<td>" + OPT_NM + "</td>"
        	    			+"<td>" + OPT_AMT + "</td>"
        	    		+ "/<tr>"

       	          $('#tbody_opt_list').append(option); 
       	      }
        },
        error:function(){
        	alert("옵션을 불러오지 못했습니다.");
        }
    });
}

//테이블의 행 클릭시 값 뿌리기
 $(document).on("click", "#tbody_opt_list tr", function () {
	 var td = $(this).children();
	 
	 var optNo = td.eq(0).text();    
	 var optNm = td.eq(1).text();    
	 var optAmt = td.eq(2).text();
	 
	 $("#optNo").val(optNo);
	 $("#optNm").val(optNm);
	 $("#optAmt").val(optAmt);
 });


// 저장


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
                        <td style="width: 110px;"><h5>옵션</h5><button class="btn_open" type="button">옵션관리</button></td>
                        <td>
                        	<input type='checkbox' name='menuOpt' value='' />
  							<input type='checkbox' name='menuOpt' value='' />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <div>
	        <button onclick="fn_save()">저장</button>
	       	<button onclick="fn_gotoMain()">목록</button>
      	</div>
     <!-- 레이어팝업 영역 -->
	 <div id="popup_area" class="modal hidden">
		 <div class="bg">
			<div class="modalBox qqq">
			    <div class="allWrapper">
			        <div>
			        	<div class="exit_area">
			        		<button id="btn_close">닫기</button>
			        	</div>
			            <h3>메뉴 옵션 관리</h3>
			            <div class="optForm_body">
			                <h4>옵션 목록</h4>
			                <div class="optListArea"><!-- 목록 영역 start -->    	
			                    <table id="table_opt" width="100%" class="table table-bordered table-hover text-center">
								<thead>
									<tr>
										<th>옵션번호</th>
										<th>옵션명</th>
										<th>옵션가격</th>
									</tr>
								</thead>
								<tbody id="tbody_opt_list">				
									<!-- 동적생성영역 -->
								</tbody>
							</table>
			                </div><!-- 목록 영역 end -->
			                <div class="optDtlArea"> <!-- 등록/수정 영역 -->
			                	<table class="table table-bordered table-hover div_content_login"	style="text-align: center; border: 1px solid #ddddddd">
								<thead>
									<tr>
										<th colspan="2"><h3>옵션</h3></th>
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
			                    <button type="button" class="commBtn" id="btn_cancel">취소</button>
			                    <button type="button" id="btn_save" class="commBtn" value="">등록</button>
			                </div>
			            </div>
			        </div>
	    			</div>
		      		
		   		</div>
	   		</div>
   		</div>
	 <!-- 레이어팝업 영역 -->
    </div>
  </div>
  </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>