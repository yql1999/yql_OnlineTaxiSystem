package cn.edu.zjut.dao;

import cn.edu.zjut.po.Passenger;

public interface IPassengerDAO {
	public void save(Passenger transientInstance);
	public Passenger findbyaccount(Passenger transientInstance);
	public Passenger findbyId(int id);
}
