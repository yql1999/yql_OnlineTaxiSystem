package cn.edu.zjut.dao;

import java.util.List;

import cn.edu.zjut.po.*;

public interface IManagerDAO {
	public void save(Manager transientInstance);
	public Manager findbyaccount(Manager transientInstance);
	public Manager findbyId(int id);
	public List findByHql(String hql);
	public Manager findpassengerbyId(int id);
	public void deletepassenger(Passenger id);
	public void deletedriver(Driver id,Car s);
	//public void deletecar(Car id);
}
