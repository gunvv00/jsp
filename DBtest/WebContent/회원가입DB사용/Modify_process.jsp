<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 단계</title>
</head>
<body>

<%
	String id = (String) session.getAttribute("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String num1 = request.getParameter("priNum1");
	String num2 = request.getParameter("priNum2");
	String priNum = num1 + "-" + num2;
	String addrNum = request.getParameter("addrNum1");
	String b1 = request.getParameter("birYear");
	String b2 = request.getParameter("birMonth");
	String b3 = request.getParameter("birDay");
	String birthDay = b1 +"."+ b2 +"."+ b3;
	String[] hobby1 = request.getParameterValues("hobby");
	String hobby = "";
	for(int i = 0; i < hobby1.length; i ++) {
		hobby += hobby1[i] + ",";
	}
	String self = request.getParameter("self");
		
	Connection conn = null;
	String sql = "UPDATE 회원가입 SET password=?,email=?,priNum=?,addrNum=?,birthDay=?,hobby=?,self=? WHERE ID = '"+id+"'";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		//객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, password);
		pstmt.setString(2, email);
		pstmt.setString(3, priNum);
		pstmt.setString(4, addrNum);
		pstmt.setString(5, birthDay);
		pstmt.setString(6, hobby);
		pstmt.setString(7, self);
		
		
		
		if(pstmt.executeUpdate() != 0) {
			out.println("<h3>레코드가 등록되었습니다.</h3>");
			
			out.println("<script>");
			out.println("location.href='main.jsp'");
			out.println("</script>");
			
		}


	}catch(Exception e) {
		out.println("<h3>레코드가 실패.</h3>");
		e.printStackTrace();
	}
%>

</body>
</html>