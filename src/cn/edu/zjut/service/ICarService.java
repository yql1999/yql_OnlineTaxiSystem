package cn.edu.zjut.service;

import cn.edu.zjut.po.*;

public interface ICarService {
	public void save(Car transientInstance);
	public Car findbyId(int transientInstance);
}
