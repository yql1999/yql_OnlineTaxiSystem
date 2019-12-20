package cn.edu.zjut.service;

import cn.edu.zjut.dao.IPassengerDAO;
import cn.edu.zjut.po.Passenger;

public class PassengerService implements IPassengerService{
	private IPassengerDAO PassengerDAO=null;
	public PassengerService() {
		System.out.println("create UserService.");
	}
	public void setCustomerDAO(IPassengerDAO passengerDAO) {
		System.out.println("--setCustomerDAO--");
		this.PassengerDAO=passengerDAO;
	}
	public void register(Passenger transientInstance) {
		System.out.println("execute--register()--method.");
		PassengerDAO.save(transientInstance);
	}
	public Boolean login(Passenger transientInstance) {
		Passenger temp=PassengerDAO.findbyaccount(transientInstance);
		if(transientInstance.getPassword().equals(temp.getPassword())) {
			return true;
		}
		return false;
	}
	public Passenger findbyId(int id) {
		System.out.println("before Passenger findbyId");
		Passenger temp=PassengerDAO.findbyId(id);
		System.out.println("after Passenger findbyId");
		return temp;
	}
	public IPassengerDAO getPassengerDAO() {
		return PassengerDAO;
	}
	public void setPassengerDAO(IPassengerDAO passengerDAO) {
		this.PassengerDAO = passengerDAO;
	}
	
}
