package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.po.Order;

public interface IOrderService {
	public void save(Order transientInstance);
	public List all(String longitude,String latitude);
	
}
