<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="fileUpload.jsp" enctype="multipart/form-data" method="post">
<table border="1" >
	<tr>
		<td colspan="2" align="center"><h4>파일 업로드폼</h4></td>
	</tr>
	<tr>
		<td>올린사람 : </td>
		<td><input type="text" name = "name"></td>
	</tr>
	<tr>
		<td>제목 : </td>
		<td><input type="text" name = "subject"></td>
	</tr>
	<tr>
		<td>파일명1</td>
		<td align="right"><input type="file" name = "filename1" value="찾아보기"></td>
	</tr>
	<tr>
		<td>파일명2</td>
		<td align="right"><input type="file" name = "filename2" value="찾아보기"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="전송"></td>
	</tr>
</table>
</form>
</body>
</html>