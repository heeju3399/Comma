function loginCheck(){
	if(document.login.id.value==""){
		alert("���̵� �Է��� �ּ���.");
		document.login.id.focus();
		return;
	}
	if(document.login.pwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���.");
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
		alert("���̵� �Է��� �ּ���.");
		document.regForm.id.focus();
		return;
	}
	if(document.regForm.pwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.regForm.pwd.focus();
		return;
	}
	if(document.regForm.repwd.value==""){
		alert("��й�ȣ�� Ȯ���� �ּ���");
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.pwd.value != document.regForm.repwd.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.birthday.value==""){
		alert("������ϸ� �Է��� �ּ���.");
		document.regForm.birthday.focus();
		return;
	}	
	if(document.regForm.email.value==""){
		alert("�̸����� �Է��� �ּ���.");
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
          alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r�ٽ� �Է��� �ּ���!');
	      document.regForm.email.focus();
		  return;
    }
}
function idCheck(id){
	if(id == ""){
		alert("���̵� �Է��� �ּ���.");
		document.regForm.id.focus();
	}else{
		url="idCheck.jsp?id=" + id;
		window.open(url,"post","width=300,height=150");
	}
}
function win_close(){
	self.close();
}
