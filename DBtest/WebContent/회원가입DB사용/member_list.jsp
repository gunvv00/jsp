<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();

		pstmt = conn.prepareStatement("select * from 회원가입");
		rs = pstmt.executeQuery();

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>

<script type="text/javascript">
	function back() {
		history.back();
	}
</script>

</head>
<body>
		<table border=1>
			<tr align=center>
				<td colspan=2>회원목록</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr align=center>
				<td>
					<a href="member_into.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("id")%></a>
				</td>
				<td>
					<a href="member_delete.jsp?id=<%=rs.getString("id") %>">정보 삭제</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	<div align="center">
		<input type="button" onclick = "back()" value="뒤로가기">
	</div>
</body>
</html>