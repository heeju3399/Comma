<%@ page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<html>
<head>
<title>ȸ������</title>
</head>
<body bgcolor="#996600" topmargin="100">
	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">
				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
					<form name="regForm" method="post" action="../sign_up">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
						</tr>
						<tr>
							<td width="16%">���̵�</td>
							<td width="57%"><input name="id" size="15"> <input
								type="button" value="ID�ߺ�Ȯ��"></td>
							<td width="27%">���̵� ���� �ּ���.</td>
						</tr>
						<tr>
							<td>�н�����</td>
							<td><input type="password" name="pwd" size="15"></td>
							<td>�н����带 �����ּ���.</td>
						</tr>
						
						
						<tr>
							<td>�������</td>
							<td><input name="birthday" size="6"> ex)830815</td>
							<td>������ϸ� ���� �ּ���.</td>
						</tr>
						<tr>
							<td>�̸���</td>
							<td><input name="email" size="27"></td>
							<td>�̸����� �����ּ���.</td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="submit"
								value="ȸ������" > &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" value="�ٽþ���">
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>

