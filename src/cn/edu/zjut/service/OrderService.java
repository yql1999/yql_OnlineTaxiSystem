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
	
	public void update(Order transientInstance) {
		orderDAO.update(transientInstance);
	}
	
	public List findorders() {
		String hql = "from Order";
		List list = orderDAO.findorders(hql);
		return list;
	}
	public List finddriverhistoryorders(Order transientInstance) {
		String hql="from Order as user where driverID="+transientInstance.getDriver().getDriverID();
		List list = orderDAO.findorders(hql);
		return list;
	}
	
	public Order findbyId(Order transientInstance) {
		Order temp=orderDAO.findbyId(transientInstance);
		return temp;
	}
	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		System.out.println("create orderDAO");
		this.orderDAO = orderDAO;
	}
    public void deleteorder(Order order) {
    	System.out.println("删除订单");
        orderDAO.deleteorder(order);
    }
    public void appraise(Order order) {
    	System.out.println("评价完成");
    	orderDAO.appraise(order);
    }
    
    public void appraise2(Order order) {
    	System.out.println("司机评价完成");
    	orderDAO.appraise2(order);
    }
    
    public void cancel(Order order) {
    	System.out.println("cancel");
    	orderDAO.cancel(order);
    }
}
