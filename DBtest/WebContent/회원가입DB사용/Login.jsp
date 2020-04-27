<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String admin = "admin";
	String adminPw = "1234";
	session.setAttribute("admin", admin);
	session.setAttribute("adminPw", adminPw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">로그인 페이지</h1>
	<div align="right">
		<a href="JoinForm.jsp">회원가입</a>
	</div>
	<hr>

	<div align="center">
		<table border="1">
			<form action="LoginProcess.jsp" method="post">
				<tr>
					<td width="100">아이디</td>
					<td width="100"><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name=passWord></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit"value="로그인">
					</td>
				</tr>
		</table>
	</div>
	</form>
</body>
</html>