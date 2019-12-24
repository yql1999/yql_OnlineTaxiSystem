package cn.edu.zjut.service;

import java.util.ArrayList;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.Passenger;

public interface IPassengerService {
	public void register(Passenger transientInstance);
	public Boolean login(Passenger transientInstance);
	public Passenger findbyId(int id);
	
	public void update(String nickname,String password);//更改乘客信息
	public Passenger select(Passenger passenger);//查询个人信息
	public Driver driverInformation(Order order);//获取接收订单的司机信息
	public ArrayList<Order> allOrder(Passenger passenger);//查看所有订单
}
