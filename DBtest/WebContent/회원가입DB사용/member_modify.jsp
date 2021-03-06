<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>  
<%
     Connection conn = null;
     PreparedStatement pstmt =null;
     ResultSet rs = null;
     String nowId = (String) session.getAttribute("id");
     
     try{
      Context init=new InitialContext();
      DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
      
      pstmt=conn.prepareStatement("select * from 회원가입 where id=?");
      pstmt.setString(1, nowId);
      rs=pstmt.executeQuery();
      while(rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name = "join" action="Modify_process.jsp" method="post">
		<div align="center">
			<table>
				<table border="1">
					<th colspan="2" " bgcolor="#e9e9e9">회원 정보 수정</th>
					<tr>
						<td bgcolor="powderblue" align="center">아이디 :</td>
						<td><input type="text" id="id" name = "id" value="<%=rs.getString("id") %>" disabled="disabled"> 4~12자의 영문 대소문자와 숫자로만
							입력</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">비밀 번호 :</td>
						<td><input type="password" id="userPW" name = "password"> 4~12자의 영문
							대소문자와 숫자로만 입력</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">비밀 번호 확인 :</td>
						<td><input type="password" id="userPW2"></td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">메일주소 :</td>
						<td><input type="email" id="userEmail" name = "email" value="<%=rs.getString("email") %>">예)id@domain.com</td>
					</tr>
					<th colspan="2" bgcolor="#e9e9e9">개인 신상 정보</th>
					<tr>
						<td bgcolor="powderblue" align="center">주민등록 번호:</td>
						<td><input type="text" id="userNum1" name = "priNum1">-
						<input type="password" id="userNum2" name = "priNum2">예)123456-1234567</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">주소:</td>
						<td><input type="text" id="sample4_postcode"placeholder="우편번호" name = "addrNum1"> 
						<input type="button" name = "addrNum2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name = "addrNum3" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" name = "addrNum4" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color: #999"></span></td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">생일</td>
						<td><input type="text" id="user_birth_year" size="10" name = "birYear">년
							<input type="text" id="user_birth_month" size="10" name = "birMonth">월
							 <input type="text" id="user_birth_day" size="10" name = "birDay">일</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">관심분야 :</td>
						<td>
							<input type="checkbox" name="hobby" value="컴퓨터" >컴퓨터 
							<input type="checkbox" name="hobby" value="인터넷">인터넷 
							<input type="checkbox" name="hobby" value="여행">여행 
							<input type="checkbox" name="hobby" value="영화감상">영화감상 
							<input type="checkbox" name="hobby" value="음악감상">음악감상
						</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">자기소개:</td>
						<td><textarea rows="5" , cols="50" id="self" name = "self"></textarea></td>
					</tr>
				</table>
<%
      }
     }catch(Exception e){
    	 e.printStackTrace();
     }
%>
				</div>
				<div align="center">
					<input type="submit" value="정보수정"> <input type="reset" value="다시 입력">
				</div>
				</form>
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script>
					function sample4_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
										var extraRoadAddr = ''; // 도로명 조합형 주소 변수
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
											extraRoadAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraRoadAddr += (extraRoadAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraRoadAddr !== '') {
											extraRoadAddr = ' ('
													+ extraRoadAddr + ')';
										}
										// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
										if (fullRoadAddr !== '') {
											fullRoadAddr += extraRoadAddr;
										}
										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
										document
												.getElementById('sample4_roadAddress').value = fullRoadAddr;
										document
												.getElementById('sample4_jibunAddress').value = data.jibunAddress;
										// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
										if (data.autoRoadAddress) {
											//예상되는 도로명 주소에 조합형 주소를 추가한다.
											var expRoadAddr = data.autoRoadAddress
													+ extraRoadAddr;
											document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
													+ expRoadAddr + ')';
										} else if (data.autoJibunAddress) {
											var expJibunAddr = data.autoJibunAddress;
											document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
													+ expJibunAddr + ')';
										} else {
											document.getElementById('guide').innerHTML = '';
										}
									}
								}).open();
					}
				</script>
</body>
</html>