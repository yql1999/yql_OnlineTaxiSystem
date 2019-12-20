package cn.edu.zjut.service;

import cn.edu.zjut.dao.IManagerDAO;
import cn.edu.zjut.po.Manager;


public class ManagerService implements IManagerService{
	private IManagerDAO managerDAO=null;
	public ManagerService() {
		System.out.println("create managerService.");
	}
	
	public void register(Manager transientInstance) {
		System.out.println("execute--register()--method.");
		managerDAO.save(transientInstance);
	}
	public Boolean login(Manager transientInstance) {
		Manager temp=managerDAO.findbyaccount(transientInstance);
		if(transientInstance.getPassword().equals(temp.getPassword())) {
			return true;
		}
		return false;
	}
	public Manager findbyId(int id) {
		System.out.println("before Manager findbyId");
		Manager temp=managerDAO.findbyId(id);
		System.out.println("after Manager findbyId");
		return temp;
	}
	public IManagerDAO getManagerDAO() {
		return managerDAO;
	}
	public void setManagerDAO(IManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

}

