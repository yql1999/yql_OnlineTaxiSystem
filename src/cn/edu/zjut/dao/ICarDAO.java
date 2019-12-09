package cn.edu.zjut.dao;

import cn.edu.zjut.po.Car;

public interface ICarDAO {
	public void save(Car transientInstance);
	public Car findbyId(Car transientInstance);
}
