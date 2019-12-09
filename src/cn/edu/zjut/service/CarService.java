package cn.edu.zjut.service;

import cn.edu.zjut.dao.CarDAO;
import cn.edu.zjut.po.Car;

public class CarService implements ICarService{
	private CarDAO carDAO=null;
	public CarService() {
		System.out.println("create CarService.");
	}
	public void save(Car transientInstance) {
		System.out.println("execute--Car.save()--method.");
		carDAO.save(transientInstance);
	}
	public CarDAO getCarDAO() {
		return carDAO;
	}
	public void setCarDAO(CarDAO carDAO) {
		this.carDAO = carDAO;
	}
}
