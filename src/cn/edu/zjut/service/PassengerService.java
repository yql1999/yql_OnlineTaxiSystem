package cn.edu.zjut.service;

import cn.edu.zjut.dao.IPassengerDAO;
import cn.edu.zjut.po.Passenger;

public class PassengerService implements IPassengerService{
	private IPassengerDAO passengerDAO=null;
	public PassengerService() {
		System.out.println("create UserService.");
	}
	public void setCustomerDAO(IPassengerDAO passengerDAO) {
		System.out.println("--setCustomerDAO--");
		this.passengerDAO=passengerDAO;
	}
	public void register(Passenger transientInstance) {
		System.out.println("execute--register()--method.");
		passengerDAO.save(transientInstance);
	}
	public Boolean login(Passenger transientInstance) {
		Passenger temp=passengerDAO.findbyaccount(transientInstance);
		if(transientInstance.getPassword().equals(temp.getPassword())) {
			return true;
		}
		return false;
	}
	public IPassengerDAO getPassengerDAO() {
		return passengerDAO;
	}
	public void setPassengerDAO(IPassengerDAO passengerDAO) {
		this.passengerDAO = passengerDAO;
	}
	
}
