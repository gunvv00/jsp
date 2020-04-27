<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String num1 = request.getParameter("priNum1");
	String num2 = request.getParameter("priNum2");
	
	session.setAttribute("prinum1", num1);
	session.setAttribute("prinum2", num2);
	
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
	String sql = "INSERT INTO 회원가입 (id, password, email, prinum, addrnum, birthday, hobby, self) VALUES (?,?,?,?,?,?,?,?)";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		//객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, email);
		pstmt.setString(4, priNum);
		pstmt.setString(5, addrNum);
		pstmt.setString(6, birthDay);
		pstmt.setString(7, hobby);
		pstmt.setString(8, self);
		
		
		
		if(pstmt.executeUpdate() != 0) {
			out.println("<h3>레코드가 등록되었습니다.</h3>");
			
			out.println("<script>");
			out.println("location.href='Login.jsp'");
			out.println("</script>");
			
		}


	}catch(Exception e) {
		out.println("<h3>레코드가 실패.</h3>");
		e.printStackTrace();
	}
%>



</body>
</html>