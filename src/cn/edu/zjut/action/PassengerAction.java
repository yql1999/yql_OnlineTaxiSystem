package cn.edu.zjut.action;

import cn.edu.zjut.po.Passenger;
import cn.edu.zjut.service.IPassengerService;

public class PassengerAction {
	private Passenger loginUser;
	private IPassengerService userService=null;
	
	
	public String register() {
		userService.register(loginUser);
		return "success";
	}
	public String login() {
		if(userService.login(loginUser))
			return "success";
		return "fail";
	}
	public Passenger getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(Passenger loginUser) {
		this.loginUser = loginUser;
	}
	public IPassengerService getUserService() {
		return userService;
	}
	public void setUserService(IPassengerService userService) {
		this.userService=userService;
	}
	
}
