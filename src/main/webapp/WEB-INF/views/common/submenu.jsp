<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
.sub_inner>ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 170px;
}

.sub_ul>li a {
	display: block;
	color: #000;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change the link color on hover */
.ahover:hover {
	background-color: #E7E3DA;
	color: black;
	font-weight: bold;
}

.snb_inner>ul>li span {
	/*주문목록*/
	padding-left: 30px;
	font-size: 14px;
}

.snb_inner>ul>li:nth-child(2) span {
	/*매출*/
}

.snb_inner>ul>li:nth-child(3) span {
	/*입고*/
}

.snb_inner>ul>li:nth-child(4) span {
	/*상품d*/
}

.snb_inner>ul>li:nth-child(5) span {
	/*리뷰관리d*/
}

.snb_inner>ul>li:nth-child(6) span {
/*회원관리d*/
}
.snb_inner>ul>li:nth-child(7) span {
/*faqd*/
}
.snb_inner>ul>li:nth-child(8) span {
/*1:1??*/
}

.sub_ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 170px;
	margin-top:10px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userId = (String)session.getAttribute("userId");
	String userNm = (String)session.getAttribute("userNm");
%>
	<div class="snb_inner">
	<% if(userId.equals("admin")){%>
		<span style="padding-left: 17px; font-size: 19px;">관리자페이지</span>
		<ul class="sub_ul">
			<li><a class="ahover" href="/admin/orderList"><span>주문관리</span></a></li>
			<li><a class="ahover" href="/admin/saleList"><span>매출조회</span></a></li>
			<li><a class="ahover" href="/admin/reserveList"><span>예약관리</span></a></li>
			<li><a class="ahover" href="/admin/prodjectList"><span>상품관리</span></a></li>
			<li><a class="ahover" href="/manage/reviewList"><span>리뷰관리</span></a></li>
      <li><a class="ahover" href="/admin/memberList"><span>회원관리</span></a></li>
      <li><a class="ahover" href="/admin/faqList"><span>FAQ관리</span></a></li>
      <li><a class="ahover" href="/admin/qnaList"><span>1:1문의관리</span></a></li>
		</ul>
	<%} else {%>
		<span style="padding-left: 17px; font-size: 19px;">마이페이지</span>
		<ul class="sub_ul">
			<li><a class="ahover" href="/mypage/orderList"><span>주문내역</span></a></li>
			<li><a class="ahover" href="/mypage/reserveList"><span>예약관리</span></a></li>
			<li><a class="ahover" href="//mypage/reviewList"><span>리뷰관리</span></a></li>
      <li><a class="ahover" href="/mypage/qnaList"><span>1:1문의관리</span></a></li>
      <li><a class="ahover" href="/mypage/memberInfo"><span>회원정보</span></a></li>
      <li><a class="ahover" href="/mypage/qnaList"><span>회원탈퇴</span></a></li>
      </ul>
	<%} %>
	</div>
</body>
</html>