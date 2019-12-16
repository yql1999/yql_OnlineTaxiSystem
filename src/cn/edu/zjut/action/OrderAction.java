package cn.edu.zjut.action;

import java.util.Iterator;
import java.util.List;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.service.IOrderService;
import cn.edu.zjut.service.DriverService;
import cn.edu.zjut.service.PassengerService;

public class OrderAction {
	private Order order;
	private IOrderService orderService;
	private List orders;
	public String save() {
		orderService.save(order);
		return "success";
	}
	
	public String ordertake() {
		orderService.ordertake(order);
		return "success";
	}
	
	public String findorders() {
		orders=orderService.findorders();
		System.out.println("Item Action executed!");
		Iterator<List> it=orders.iterator();
		Order t=new Order();
		t=(Order)it.next();
		order=t;
		while(it.hasNext()) {
			t=(Order)it.next();

			System.out.println(t.getOrderID());
			System.out.println(t.getStart());
			System.out.println(t.getDestination());

			
		}
		return "success";
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	public List getOrders() {
		return orders;
	}

	public void setOrders(List orders) {
		this.orders = orders;
	}
	
	
}
