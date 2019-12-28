package cn.edu.zjut.action;

import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.Passenger;
import cn.edu.zjut.service.IPassengerService;

public class PassengerAction {
	private String nickname;
	private String password;
	private Passenger loginUser;
	private Order order;
	private IPassengerService passengerService = null;

	public PassengerAction() {
		System.out.println("create PassengerAction.");
	}

	public String register() {
		passengerService.register(loginUser);
		return "success";
	}

	public String login() {
		if (passengerService.login(loginUser)) {
			loginUser=passengerService.findbyaccount(loginUser);
			return "success";
			}
		return "fail";
	}

	public String update() {
		passengerService.update(nickname, password);
		System.out.println(nickname);
		System.out.println("Passenger update action");
		return "success";
	}

	public String select() {
		passengerService.select(loginUser);
		return "success";
	}

	public String driverInformation() {
		passengerService.driverInformation(order);
		return "success";
	}

	public String allOrder() {
		passengerService.allOrder(loginUser);
		return "success";
	}
	
	public String currOrder() {
		passengerService.currOrder(loginUser);
		return "success";
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Passenger getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(Passenger loginUser) {
		this.loginUser = loginUser;
	}

	public IPassengerService getPassengerService() {
		return passengerService;
	}

	public void setPassengerService(IPassengerService userService) {
		this.passengerService = userService;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
