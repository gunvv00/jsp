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
		<td colspan="2" align="center"><h4>���� ���ε���</h4></td>
	</tr>
	<tr>
		<td>�ø���� : </td>
		<td><input type="text" name = "name"></td>
	</tr>
	<tr>
		<td>���� : </td>
		<td><input type="text" name = "subject"></td>
	</tr>
	<tr>
		<td>���ϸ�1</td>
		<td align="right"><input type="file" name = "filename1" value="ã�ƺ���"></td>
	</tr>
	<tr>
		<td>���ϸ�2</td>
		<td align="right"><input type="file" name = "filename2" value="ã�ƺ���"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="����"></td>
	</tr>
</table>
</form>
</body>
</html>