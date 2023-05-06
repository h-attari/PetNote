function Name(n)
{
	var flag=true;
	var a=/^[A-Z a-z]+$/;
	name=document.getElementById(n).value;
	if(a.test(name)||name.length==0)
		document.getElementById("error").innerHTML=null;
	else
	{
		document.getElementById("error").innerHTML="Invalid Name";
		document.getElementById(n).value=null;
		flag=false;
	}
	return flag;
}
function Mobile(n)
{
	var flag=true;
	var a=/^[0-9]+$/;
	mob=document.getElementById(n).value;
	if(mob.length==0||a.test(mob))
	{
		if(mob.length==10||mob.length==0)
		{
			document.getElementById("error").innerHTML=null;
		}
		else
		{
			document.getElementById("error").innerHTML="Invalid Mobile no.";
			document.getElementById(n).value=null;
			flag=false;
		}
	}
	else
	{
		document.getElementById("error").innerHTML="Invalid Mobile no.";
		document.getElementById(n).value=null;
		flag=false;
	}
	return flag;
}
function Mail(n)
{
	var flag=true;
	var a=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	mail=document.getElementById(n).value;
	if(a.test(mail)||mail.length==0)
	{
		document.getElementById("error").innerHTML=null;
	}
	else
	{
		document.getElementById("error").innerHTML="Invalid Email";
		document.getElementById(n).value=null;
		flag=false;
	}
	return flag;
}
function Password(n)
{
	var flag=true;
	pass=document.getElementById(n).value;
	if(pass.length==0||pass.length>7)
	{
		document.getElementById("error").innerHTML=null;
	}
	else
	{
		document.getElementById("error").innerHTML="Password should be of min. 8 characters";
		document.getElementById(n).value=null;
		flag=false;
	}
	return flag;
}
function Confirm(n,m)
{
	var flag=true;
	pass=document.getElementById(n).value;
	cpass=document.getElementById(m).value;
	if(cpass==pass)
	{
		document.getElementById("error").innerHTML=null;
	}
	else
	{
		document.getElementById("error").innerHTML="Password doesn't match";
		document.getElementById(m).value=null;
		flag=false;
	}
	return flag;	
}
function CVV(n)
{
	var flag
	var a=/^[0-9]+$/;
	mob=document.getElementById(n).value;
	if(mob.length==0||a.test(mob))
	{
		if(mob.length==3||mob.length==0)
		{
			document.getElementById("error").innerHTML=null;
			flag=true;
		}
		else
		{
			document.getElementById("error").innerHTML="Invalid cvv no.";
			document.getElementById(n).value=null;
			flag=false;
		}
	}
	else
	{
		document.getElementById("error").innerHTML="Invalid cvv no.";
		document.getElementById(n).value=null;
		flag=false;
	}
	return flag;
}
function Card(n)
{
	var flag
	var a=/^[0-9]+$/;
	mob=document.getElementById(n).value;
	if(a.test(mob))
	{
		document.getElementById("error").innerHTML=null;
		flag=true;
	}
	else
	{
		document.getElementById("error").innerHTML="Invalid card no.";
		document.getElementById(n).value=null;
		flag=false;
	}
	return flag;
}
function Dother(n)
{
	a=document.getElementById(n);
	a.disabled=true;
	document.getElementById("btn").disabled=false;
}
function Other(n)
{
	a=document.getElementById(n);
	a.disabled=false;
	document.getElementById("btn").disabled=false;
}
function Sother(n,m)
{
	v=document.getElementById(m).value;
	a=document.getElementById(n);
	if(v==-1)
	{
		a.disabled=false;
	}
	else
	{
		a.disabled=true;
	}
}
function Promocode(n)
{
	document.getElementById(n).value=null;
	document.getElementById("nopromo").innerHTML="Promocode not Available";
}
function goBack()
{
	window.history.back();
}