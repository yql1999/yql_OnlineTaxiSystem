package cn.edu.zjut.dao;

import java.util.List;

import cn.edu.zjut.po.Order;

public interface IOrderDAO {
	public void save(Order transientInstance);
	public Order findbyId(Order transientInstance);
	public void update(Order transientInstance);
	public List findorders(String hql);
	
}
