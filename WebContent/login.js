function login() {
	var v = document.getElementById("logintype").value;
	var form = document.getElementById("form1");
	if (v == 0) {
		form.action = "passengerlogin";
	} else if (v == 1) {
		form.action = "driverlogin";
	} else if (v == 2) {
		form.action = "managerlogin";
	}
}
