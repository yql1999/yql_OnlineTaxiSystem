package cn.edu.zjut.service;

import cn.edu.zjut.po.Driver;

public interface IDriverService {
	public void register(Driver transientInstance);
	public Boolean login(Driver transientInstance);
}
