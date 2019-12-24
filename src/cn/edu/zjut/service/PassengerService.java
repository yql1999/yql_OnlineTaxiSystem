package cn.edu.zjut.service;

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

	@Override
	public void update(String nickname, String password) {
		Passenger passenger = (Passenger) ActionContext.getContext().getSession().get("passenger");
		passenger.setNickname(nickname);
		passenger.setPassword(password);
		PassengerDAO.update(passenger);
		// System.out.println("Passenger update");
	}

	@Override
	public Passenger select(Passenger passenger) {
		System.out.println("Passenger select service");
		return PassengerDAO.select(passenger);
	}

	@Override
	public Driver driverInformation(Order order) {
		System.out.println("Passenger driverInformation service");
		Driver driver=PassengerDAO.driverInformation(order);
		ActionContext.getContext().getSession().put("driver", driver);
		return driver;
	}

	@Override
	public ArrayList<Order> allOrder(Passenger passenger) {
		System.out.println("Passenger allOrder service");
		ArrayList<Order> orders = PassengerDAO.allOrder(passenger);
		ActionContext.getContext().getSession().put("orders", orders);
		return orders;
	}

	public IPassengerDAO getPassengerDAO() {
		return PassengerDAO;
	}

	public void setPassengerDAO(IPassengerDAO passengerDAO) {
		this.PassengerDAO = passengerDAO;
	}

}
