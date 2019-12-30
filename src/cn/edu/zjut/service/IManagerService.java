package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.po.*;


public interface IManagerService {
	public void register(Manager transientInstance);
	public Boolean login(Manager transientInstance);
	public Manager findbyId(int id);
	public void deletepassenger(Passenger transientInstance);
	public void deletedriver(Driver transientInstance);
	public void deletecar(Car transientInstance);
	public List findPassengerByHql();
	public List findDriverByHql();
	public List<Order> findOrderByHql();
	
}
