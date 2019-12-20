package cn.edu.zjut.dao;

import cn.edu.zjut.po.Driver;


public interface IDriverDAO {
	public void save(Driver transientInstance);
	public Driver findbyaccount(Driver transientInstance);
	public Driver findbyId(Driver transientInstance);
	public void update(Driver transientInstance);
}
