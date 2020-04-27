<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	String nowId = request.getParameter("id");
	
%>

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
      pstmt.setString(1, nowId);
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
</table>
</div>
<%
      }
     }catch(Exception e) {
    	 e.printStackTrace();
     }
%>

</body>
</html>