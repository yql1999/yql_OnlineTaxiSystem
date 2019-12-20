package cn.edu.zjut.action;

import cn.edu.zjut.po.Passenger;
import cn.edu.zjut.service.IPassengerService;

public class PassengerAction {
	private Passenger loginPassenger;
	private IPassengerService passengerService=null;
	public PassengerAction() {
		System.out.println("create PassengerAction.");
	}
	
	public String register() {
		passengerService.register(loginPassenger);
		return "success";
	}
	public String login() {
		if(passengerService.login(loginPassenger))
			return "success";
		return "fail";
	}
	public Passenger getLoginUser() {
		return loginPassenger;
	}
	public void setLoginUser(Passenger loginUser) {
		this.loginPassenger = loginUser;
	}
	public IPassengerService getPassengerService() {
		return passengerService;
	}
	public void setPassengerService(IPassengerService userService) {
		this.passengerService=userService;
	}
	
}
