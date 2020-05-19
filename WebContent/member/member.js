function loginCheck(){
	if(document.login.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.login.id.focus();
		return;
	}
	if(document.login.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.login.pwd.focus();
		return;
	}
	document.login.submit();
}

function memberReg(){
	document.location="member.jsp";
}

function inputCheck(){
	if(document.regForm.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
		return;
	}
	if(document.regForm.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.regForm.pwd.focus();
		return;
	}
	if(document.regForm.repwd.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.pwd.value != document.regForm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.birthday.value==""){
		alert("생년월일를 입력해 주세요.");
		document.regForm.birthday.focus();
		return;
	}	
	if(document.regForm.email.value==""){
		alert("이메일을 입력해 주세요.");
		document.regForm.email.focus();
		return;
	}
    var str=document.regForm.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.regForm.email.focus();
		  return;
    }
}
function idCheck(id){
	if(id == ""){
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
	}else{
		url="idCheck.jsp?id=" + id;
		window.open(url,"post","width=300,height=150");
	}
}
function win_close(){
	self.close();
}
