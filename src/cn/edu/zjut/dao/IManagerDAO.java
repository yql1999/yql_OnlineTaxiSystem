package cn.edu.zjut.dao;

import cn.edu.zjut.po.Manager;

public interface IManagerDAO {
	public void save(Manager transientInstance);
	public Manager findbyaccount(Manager transientInstance);
	public Manager findbyId(int id);
}
