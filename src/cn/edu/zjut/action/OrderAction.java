package cn.edu.zjut.action;

import java.util.List;

import cn.edu.zjut.po.Order;
import cn.edu.zjut.service.IOrderService;

public class OrderAction {
	private Order order;
	private IOrderService orderService;
	private List orderlist;
	private String longitude;
	private String latitude;
	public String save() {
		orderService.save(order);
		return "success";
	}
	public void all() {
		setOrderlist(orderService.all(longitude,latitude));
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

	public List getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List orderlist) {
		this.orderlist = orderlist;
	}
	
	
}
