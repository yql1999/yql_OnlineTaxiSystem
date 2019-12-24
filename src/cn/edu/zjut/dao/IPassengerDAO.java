package cn.edu.zjut.dao;

import java.util.ArrayList;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.Passenger;

public interface IPassengerDAO {
	public void save(Passenger transientInstance);
	public Passenger findbyaccount(Passenger transientInstance);
	public Passenger findbyId(int id);

	public void update(Passenger passenger);//更改乘客信息
	public Passenger select(Passenger passenger);//查询个人信息
	public Driver driverInformation(Order order);//获取接收订单的司机信息
	public ArrayList<Order> allOrder(Passenger passenger);//查看所有订单
	
	public void addOrder(Order order);//下单
	public void deleteOrder(Order order);//删除订单
	public void estimate(Driver driver);//评价
	public void pay(Passenger passenger);//支付
	
}
