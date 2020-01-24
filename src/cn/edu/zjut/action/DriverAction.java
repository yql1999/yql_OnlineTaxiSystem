package cn.edu.zjut.action;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.service.IDriverService;

public class DriverAction {
	private Driver loginUser;
	private IDriverService driverService = null;

	public String register() {
		driverService.register(loginUser);
		return "success";
	}

	public String update() {
		driverService.update(loginUser);
		return "success";
	}

	public String driverInfo() {
		loginUser = driverService.findbyId(loginUser);
		return "success";
	}

	public String driverinfochange() {
		Driver d = new Driver();
		System.out.println(loginUser.getDriverID());
		d = driverService.findbyId(loginUser);
		d.setName(loginUser.getName());
		d.setGender(loginUser.getGender());
		d.setAge(loginUser.getAge());
		d.setIdnumber(loginUser.getIdnumber());
		d.setPassword(loginUser.getPassword());
		d.setTelephone(loginUser.getTelephone());
		d.getCar().setColor(loginUser.getCar().getColor());
		d.getCar().setSeats(loginUser.getCar().getSeats());
		d.getCar().setPlate(loginUser.getCar().getPlate());
		d.getCar().setType(loginUser.getCar().getType());
		driverService.update(d);
		return "success";
	}

	public String login() {
		if (driverService.login(loginUser)) {
			loginUser = driverService.findbyAccount(loginUser);
			return "success";
		}
		return "fail";
	}

	// public String query()
	public Driver getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(Driver loginUser) {
		this.loginUser = loginUser;
	}

	public IDriverService getdriverService() {
		return driverService;
	}

	public void setdriverService(IDriverService driverService) {
		this.driverService = driverService;
	}
}
