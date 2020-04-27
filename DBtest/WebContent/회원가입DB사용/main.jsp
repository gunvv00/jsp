<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
	<div align="right">
		<a href = "Login.jsp">로그아웃</a>
	</div>

	<%
		String id = (String) session.getAttribute("id");
		String admin = (String) session.getAttribute("admin");
		String adminPw = (String) session.getAttribute("adminPw");
		
		
	%>

	<h3><%=id%>님이 로그인 되셨습니다.</h3>
	<hr>
	
	<div align="center">
  <%
     Connection conn = null;
     PreparedStatement pstmt =null;
     ResultSet rs = null;
     
     try{
      Context init=new InitialContext();
      DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
      
      pstmt=conn.prepareStatement("select * from 회원가입 where id=?");
      pstmt.setString(1, id);
      rs=pstmt.executeQuery();
      while(rs.next()) {
%>
<table border="1">
	<tr>
		<td colspan="2" >회원 정보</td>
	</tr>
	<tr>
		<td>ID</td>
		<td><%=rs.getString("id") %></td>
	</tr>
	<tr>
		<td>password</td>
		<td><%=rs.getString("password") %></td>
	</tr>
	<tr>
		<td>Email</td>
		<td><%=rs.getString("email") %></td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><%=rs.getString("prinum") %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=rs.getString("addrnum") %></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><%=rs.getString("birthday") %></td>
	</tr>
	<tr>
		<td>취미</td>
		<td><%=rs.getString("hobby") %></td>
	</tr>
	<tr>
		<td>자기소개</td>
		<td><%=rs.getString("self") %></td>
	</tr>
	<tr>
		<td>회원 정보 수정</td>
		<td align="center"><a href="member_modify.jsp">정보수정</td>
	</tr>
</table>
</div>
<%
      }
     }catch(Exception e) {
    	 e.printStackTrace();
     }
%>


	<%
		if (id.equals("admin")) {
	%>
	<a href="member_list.jsp">회원 정보 관리</a>
	<%
		}
	%>


</body>
</html>