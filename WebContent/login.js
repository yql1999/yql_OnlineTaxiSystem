function login() {
	
	
        var v=document.getElementById("logintype").value;
		if (v == 0) {
			window.location.href="passenger";
		} 
		else if (v == 1) {
			window.location.href="driver";
		} 
		else if (v == 2) {
			window.location.href="manager";
		} 
		else {
			alert("请输入正确的类型");
			window.location.href="Login.jsp";
			
		}
}


