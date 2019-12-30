package cn.edu.zjut.service;


import javax.persistence.Query;

import cn.edu.zjut.dao.IPassengerDAO;

import java.util.ArrayList;

import javax.transaction.Transactional;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.IPassengerDAO;
import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.Passenger;

@Transactional
public class PassengerService implements IPassengerService {
	private IPassengerDAO PassengerDAO = null;

	public PassengerService() {
		System.out.println("create UserService.");
	}

	public void setCustomerDAO(IPassengerDAO passengerDAO) {
		System.out.println("--setCustomerDAO--");
		this.PassengerDAO = passengerDAO;
	}

	public void register(Passenger transientInstance) {
		System.out.println("execute--register()--method.");
		PassengerDAO.save(transientInstance);
		ActionContext.getContext().getSession().put("passenger", transientInstance);
	}

	public Boolean login(Passenger transientInstance) {
		Passenger passenger = PassengerDAO.findbyaccount(transientInstance);
		if (transientInstance.getPassword().equals(passenger.getPassword())) {
			ActionContext.getContext().getSession().put("passenger", passenger);
			return true;
		}
		return false;
	}

	public Passenger findbyId(int id) {
		System.out.println("before Passenger findbyId");
		Passenger temp = PassengerDAO.findbyId(id);
		System.out.println("after Passenger findbyId");
		return temp;
	}
	public Passenger findbyaccount(Passenger transientInstance) {
		System.out.println("before Passenger findbyaccount");
		Passenger temp=PassengerDAO.findbyaccount(transientInstance);
		System.out.println("after Passenger findbyaccount");
		return temp;
	}

	public void update(String nickname, String password) {
		Passenger passenger = (Passenger) ActionContext.getContext().getSession().get("passenger");
		passenger.setNickname(nickname);
		passenger.setPassword(password);
		PassengerDAO.update(passenger);
		// System.out.println("Passenger update");
	}
	public Boolean isSuccess() {
		if(PassengerDAO.isSuccess())
			return true;
		return false;
	}

	public Passenger select(Passenger passenger) {
		System.out.println("Passenger select service");
		return PassengerDAO.select(passenger);
	}

	public Driver driverInformation(Order order) {
		order = (Order) ActionContext.getContext().getSession().get("currOrder");
		System.out.println("Passenger driverInformation service");
		Driver driver=PassengerDAO.driverInformation(order);
		ActionContext.getContext().getSession().put("driver", driver);
		return driver;
	}

	public ArrayList<Order> allOrder(Passenger passenger) {
		System.out.println("Passenger allOrder service");
		ArrayList<Order> orders = PassengerDAO.allOrder(passenger);
		ActionContext.getContext().getSession().put("orders", orders);
		return orders;
	}

	public Order currOrder(Passenger passenger) {
		System.out.println("Passenger currOrder service");
		Order order = PassengerDAO.currOrder(passenger);
		ActionContext.getContext().getSession().put("currOrder", order);
		return order;
	}
	
	public IPassengerDAO getPassengerDAO() {
		return PassengerDAO;
	}

	public void setPassengerDAO(IPassengerDAO passengerDAO) {
		this.PassengerDAO = passengerDAO;
	}
}
