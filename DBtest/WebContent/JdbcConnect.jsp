<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*" %>

<%
	Connection conn = null;
	
	String diver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Boolean connect = false;
	
	try{
		Class.forName(diver);
		conn = DriverManager.getConnection(url, "hr","hr");
		
		connect = true;
		
		conn.close();
	}catch(Exception e) {
		connect = false;
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JDBC ���� ����</title>
</head>
<body>

<%if(connect == true) {%>
	����Ǿ����ϴ�.
<% }else {%>
	���ῡ �����߽��ϴ�.
<%} %>


</body>
</html>