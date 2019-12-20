package cn.edu.zjut.service;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;

public interface IDriverService {
	public void register(Driver transientInstance);
	public Boolean login(Driver transientInstance);
	public void update(Driver transientInstance);
	public Driver findbyId(Driver transientInstance);
}
