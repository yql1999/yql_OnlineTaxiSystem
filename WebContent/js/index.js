window.onload=function(){
	var sName=localStorage.getItem("keyNumber");
	var sPass=localStorage.getItem("keyPassword");
	if(sName)
		document.getElementById("inputNumber").value=sName;
	if(sPass)
		document.getElementById("inputPassword").value=sPass;
	document.getElementById("connect").onclick=function()
	{
		var sName=document.getElementById("inputNumber").value;
		var sPass=document.getElementById("inputPassword").value;
		localStorage.setItem("keyNumber",sName);
		if(document.getElementById("checkbox").checked){
			localStorage.setItem("keyPassword",sPass);
		}
		else{
			localStorage.removeItem("keyPassword");
		}
		if(document.getElementById("inputNumber").value)
			if(document.getElementById("inputPassword").value)
				{
				window.location.href="console.html";
				return false;
				}

	}
	
}

