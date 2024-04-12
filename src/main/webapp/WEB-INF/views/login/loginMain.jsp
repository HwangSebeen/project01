<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인메인 진입</h2>
	<div><!-- 내용영역 -->
		<form method="post" action="login/join">
			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #ddddddd">
				<thead>
					<tr>
						<th colspan="2"><h4>로그인</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="id" name="id"
							maxlength="20" placeholder="아이디를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td><input class="form-control" type="password" id="pass"
							name="pass" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td style="text-align: left" colspan="2">
							<form action="/login/login" method="post">
								<button>로그인</button>
							</form>
						</td>
						<td>
							<form action="/login/join" method="get">
								<button>회원가입</button>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div><!-- 내용영역 -->
	
</body>
</html>