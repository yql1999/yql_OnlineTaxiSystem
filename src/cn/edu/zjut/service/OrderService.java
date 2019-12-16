package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.dao.IOrderDAO;
import cn.edu.zjut.po.Order;

public class OrderService implements IOrderService {
	private IOrderDAO orderDAO=null;

	public OrderService() {
		System.out.println("create OrderService.");
	}
	
	public void save(Order transientInstance) {
		System.out.println("execute--save()--method.");
		orderDAO.save(transientInstance);
	}
	
	public void ordertake(Order transientInstance) {
		orderDAO.update(transientInstance);
	}
	
	public List findorders() {
		String hql = "from Order";
		List list = orderDAO.findorders(hql);
		return list;
	}
	
	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		System.out.println("create orderDAO");
		this.orderDAO = orderDAO;
	}

}
