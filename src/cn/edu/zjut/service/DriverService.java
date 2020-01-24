package cn.edu.zjut.service;

import cn.edu.zjut.dao.IDriverDAO;
import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;

public class DriverService implements IDriverService {
	private IDriverDAO DriverDAO = null;

	public DriverService() {
		System.out.println("create DriverService.");
	}

	public void register(Driver transientInstance) {
		System.out.println("execute--register()--method.");
		DriverDAO.save(transientInstance);
	}

	public Boolean login(Driver transientInstance) {
		Driver temp = DriverDAO.findbyaccount(transientInstance);
		if (transientInstance.getPassword().equals(temp.getPassword())) {
			return true;
		}
		return false;
	}

	public Driver findbyId(Driver transientInstance) {
		return DriverDAO.findbyId(transientInstance);
	}

	public Driver findbyAccount(Driver transientInstance) {
		Driver temp = DriverDAO.findbyaccount(transientInstance);
		return temp;
	}

	public void update(Driver transientInstance) {
		DriverDAO.update(transientInstance);
	}

	public IDriverDAO getDriverDAO() {
		return DriverDAO;
	}

	public void setDriverDAO(IDriverDAO driverDAO) {
		this.DriverDAO = driverDAO;
	}

}
