<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	Connection conn = null;
	String sql = "INSERT INTO student (num,name) VALUES (6 , 'superman')";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		//��ü ����
		Statement stmt = conn.createStatement();
		
		int result = stmt.executeUpdate(sql);
		
		if(result != 0) {
			out.println("<h3>���ڵ尡 ��ϵǾ����ϴ�.</h3>");
		}
	}catch(Exception e) {
		out.println("<h3>���ڵ尡 ����.</h3>");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>