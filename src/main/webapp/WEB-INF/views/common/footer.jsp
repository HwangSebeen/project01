<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
footer {
	width: 100%;
	position: relative;
	bottom: 0px;
	padding: 15px 0;
	margin-top: 20px;
	border: 2px solid black;
}

.footer_content {
	margin-left: 100px;
	color: black;
}

.footer_info label {
	font-size: 30px;
}

.footer_info {
	text-align: left;
}

.footer_info a {
	text-decoration: none;
	color: black;
	font-weight: bolder;
	font-size: 12px;
}

.footer_contact {
	text-align: left;
	font-weight: lighter;
	font-size: 0.9rem;
}

.goUp {
	position: fixed;
	text-align: center;
	z-index: 10;
	bottom: 20px;
	right: 20px;
}

.goUp_btn {
	background: black;
/* 	border: 2px solid black; */
	border-radius: 15px;
	width: 40px;
	height: 40px;
	font-size: 20px;
}

.goUp_btn:hover {
	transition: 1s;
	padding-bottom: 10px;
}

</style>
<footer>
	<div class="footer_content">
		<p class="footer_info">
			<a onclick="privacy_policy()">개인정보 처리 방침</a> | <a
				onclick="use_policy()">이용약관</a>
		</p>
		<p class="footer_contact">
			서울특별시 행복동 희망구 | TEL. 02-1234-5678 |
			www.planacoffee.com<br> &copy; PLAN A COFFEE
		</p>
	</div>

</footer>
</html>