<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
<!--default.css-->
*{
	margin:0;
	padding:0;
}
html{
	box-sizing:border-box;
	width:100%;
	height:100%;
}
body{
	width:100%:
	height:auto;
}
<!--member.css-->
	.wrapper 					{  background-color:black; border:1px solid black; }
	#members 					{  }
		.member					{  }
			.m_id				{  }
			.m_pwd				{  }
			.m_email			{  }
			.m_birth			{  }
			.m_visited			{  }
			.m_auth 			{  }
		table				{ border-collapse:collapse;}
		tr					{ border:1px solid black;}
		td				    { border:1px solid black;}
</style>
</head>
<body>
<div class="wrapper">
	<table id="members">
		<c:forEach items="${members}" var="member" step="1">
			${member.toTable() }	
		</c:forEach>
	</table>
	</div>
</body>
</html>
