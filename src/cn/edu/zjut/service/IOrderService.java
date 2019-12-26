package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.po.Order;

public interface IOrderService {
	public void save(Order transientInstance);
	public void update(Order transientInstance);
	public List findorders();
	public Order findbyId(Order transientInstance);
	public void deleteorder(Order order);
	public void appraise(Order order);
	 public void cancel(Order order);

}
