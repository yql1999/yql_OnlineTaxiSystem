package cn.edu.zjut.action;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.service.IDriverService;

public class DriverAction {
	private Driver loginUser;
	private IDriverService driverService=null;
	
	
	public String register() {
		driverService.register(loginUser);
		return "success";
	}
	public String login() {
		if(driverService.login(loginUser))
		{
			loginUser=driverService.findbyAccount(loginUser);
			return "success";
		}
		return "fail";
	}
	//public String query()
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
		this.driverService=driverService;
	}
}
