package cn.edu.zjut.service;

import cn.edu.zjut.dao.IDriverDAO;
import cn.edu.zjut.po.Driver;


public class DriverService implements IDriverService{
	private IDriverDAO driverDAO=null;
	public DriverService() {
		System.out.println("create DriverService.");
	}

	public void register(Driver transientInstance) {
		System.out.println("execute--register()--method.");
		driverDAO.save(transientInstance);
	}
	public Boolean login(Driver transientInstance) {
		Driver temp=driverDAO.findbyaccount(transientInstance);
		if(transientInstance.getPassword().equals(temp.getPassword())) {
			return true;
		}
		return false;
	}
	public Driver findbyId(Driver transientInstance) {		
		return driverDAO.findbyId(transientInstance);
	}

	public IDriverDAO getDriverDAO() {
		return driverDAO;
	}

	public void setDriverDAO(IDriverDAO driverDAO) {
		this.driverDAO = driverDAO;
	}
	
}
