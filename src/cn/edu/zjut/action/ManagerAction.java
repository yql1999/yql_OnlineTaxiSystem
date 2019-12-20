package cn.edu.zjut.action;

import cn.edu.zjut.po.Manager;
import cn.edu.zjut.service.IManagerService;

public class ManagerAction {
	private Manager loginManager;
	private IManagerService managerService=null;
	public ManagerAction() {
		System.out.println("create ManagerAction.");
	}
	
	public String register() {
		managerService.register(loginManager);
		return "success";
	}
	public String login() {
		if(managerService.login(loginManager))
			return "success";
		return "fail";
	}
	public Manager getLoginUser() {
		return loginManager;
	}
	public void setLoginUser(Manager loginUser) {
		this.loginManager = loginUser;
	}
	public IManagerService getManagerService() {
		return managerService;
	}
	public void setManagerService(IManagerService userService) {
		this.managerService=userService;
	}
	
}
