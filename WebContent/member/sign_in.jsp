<%@page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR");%>
<html>
<head>
<title>로그인</title> 

</head>
<body bgcolor="#996600" topmargin="100">
<form method="post" action="../sign_in">
<table width="75%" align="center" bgcolor="#FFFF99">
	<tr bordercolor="#FFFF99">  
	<td height="190">
		<table width="50%" border="1" align="center">
		<tr bordercolor="#FFFF66"> 
			<td colspan="2" align="center">로그인</td>
		</tr>
		<tr  align="center"> 
			<td width="47%">ID</td>
			<td width="53%"><input name="m_id" value="aaa"></td>
		</tr>
		<tr> 
			<td align="center">Password</td>
			<td align="center"><input name="m_pwd" value="1234"></td>
		</tr>
		<tr> 
			<td colspan="2" align="center"><input type="submit" value="login">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="reset" value="reset">
			</td>
		</tr>
		</table>
	</td>
	</tr> 
</table>
</form>

</body>
</html>