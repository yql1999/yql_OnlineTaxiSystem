package cn.edu.zjut.dao;

import cn.edu.zjut.po.*;

public interface ICarDAO {
	public void save(Car transientInstance);
	public Car findbyId(int transientInstance);
}
