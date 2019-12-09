package cn.edu.zjut.service;

import cn.edu.zjut.po.Passenger;

public interface IPassengerService {
	public void register(Passenger transientInstance);
	public Boolean login(Passenger transientInstance);
	
}
