package cn.edu.zjut.service;

import cn.edu.zjut.po.Manager;

public interface IManagerService {
	public void register(Manager transientInstance);
	public Boolean login(Manager transientInstance);
	public Manager findbyId(int id);
}
