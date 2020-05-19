<%@ page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<html>
<head>
<title>회원가입</title>
</head>
<body bgcolor="#996600" topmargin="100">
	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">
				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
					<form name="regForm" method="post" action="../sign_up">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
						</tr>
						<tr>
							<td width="16%">아이디</td>
							<td width="57%"><input name="id" size="15"> <input
								type="button" value="ID중복확인"></td>
							<td width="27%">아이디를 적어 주세요.</td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="pwd" size="15"></td>
							<td>패스워드를 적어주세요.</td>
						</tr>
						
						
						<tr>
							<td>생년월일</td>
							<td><input name="birthday" size="6"> ex)830815</td>
							<td>생년월일를 적어 주세요.</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input name="email" size="27"></td>
							<td>이메일을 적어주세요.</td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="submit"
								value="회원가입" > &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" value="다시쓰기">
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>

