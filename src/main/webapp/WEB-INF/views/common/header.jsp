<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
* {
 	font-family: "IBM Plex Sans KR", sans-serif;
  font-weight: 400;
  font-style: normal;
}
a {
	text-decoration: none;
	cursor: pointer;
}

html, body {
	padding: 0;
	margin: 0;
	height: 93.35%;
}

.wrapper {
	position: relative;
	min-height: 90%;
}

button {
	cursor: pointer;
}

input[type=button] {
	cursor: pointer;
}

header {
	width: 100%;
	display: flex;
	align-items: center;
	padding: 20px 0;
}

.main_logo {
	text-align: center;
}

.main_logo img {
	display: inline-block;
	height: 150px;
}

.menu_nav {
	width: 40%;
	display: flex;
	list-style: none;
	text-align: center;
 	padding-left: 60px;
}

.menu_nav a {
	color: #808080;
	font-size: 20px;
	font-weight: bold;
 	transition: 0.5s;
	cursor: pointer;
}

.menu_nav a:not(.customer):hover {
	color: #6B0E1F;
	font-size: 15px;
}

.customer:hover {
	color: #6B0E1F;
}

.menu_nav li {
	list-style: none;
	padding: 8px 0 8px 50px;
}

.menu_nav li:hover ul.customer_sub {
	display: block;
	text-align: center;
}

.menu_nav li:hover .customer {
	color: #6B0E1F;
}

.customer_sub {
	display: none;
/* 	position: absolute; */
	left: 255px;
	text-align: center;
/* 	width: 120px; */
	text-align: center;
/* 	padding-top: 5px; */
}

.customer_sub li {
	padding: 0px;
}

.member_nav {
/* 	width: 40%; */
	display: flex;
/* 	padding: 8px 60px 8px 0; */
	justify-content: end;
}

.member_nav img {
	padding: 20px;
	height: 50px;
	padding-bottom: 10px;
	cursor: pointer;
}

.member_nav li {
	list-style: none;
	width: 120px;
	text-align: center;
	padding-bottom: 5px;
}

.member_nav li:hover ul.member_sub {
	display: block;
	text-align: center;
}

.member_sub {
	display: none;
	position: absolute;
	padding-left: 0px;
	text-align: center;
}

.submenu a {
	text-decoration: none;
	color: #808080;
	font-weight: bold;
	font-size: 15px;
	transition: 0.5s;
	white-space: pre;
}

.submenu a:hover {
	color: #6B0E1F;
	font-size: 20px;
}

</style>
<script>
</script>
<header>
<%
	String userId = (String)session.getAttribute("userId");
	String userNm = (String)session.getAttribute("userNm");
%>
	<div class="main_logo">
		<a href="/"> <img alt="logo" src="/resources/images/logo.png" style="width:300px; margine-left:10px;">
		</a>
	</div>
	<ul class="menu_nav">
		<li><a href="">소개</a></li>
		<li><a href="">SHOP</a></li>
        <li><a href="">예약</a></li>
		<li><a class="customer" href="">게시판</a>
			<ul class="customer_sub submenu">
				<li><a href="/board/noticeMain">공지사항</a></li>
				<li><a href="">FAQ</a></li>
				<li><a href="">1:1문의</a></li>
			</ul>
        </li>
	</ul>
	<ul class="member_nav">
		<%=userNm %> 님(<%=userId %>)
		<li>
			<a href=""> <img alt="logo" class="shopping_cart" src="/resources/images/cart.jpg"></a>
		</li>
		<li><img alt="logo" class="login_icon" src="/resources/images/heart.png">
			<ul class="member_sub submenu">
				<% if(userId == null){%>

					<li><a href="/login/loginMain">로그인</a></li>
                	<li><a href="/login/join">회원가입</a></li>
					
				<%} else if(userId.equals("admin")){%>
					<li><a href="/member/logout">로그아웃</a></li>
                    <li><a href="/orderManage/list">관리자페이지</a></li>
					
				<%} else {%>
					<li><a href="/member/logout">로그아웃</a></li>
                    <li><a href="/mypage/orderlist">마이페이지</a></li>
				<%}%>
			</ul></li>
	</ul>
</header>
</html>