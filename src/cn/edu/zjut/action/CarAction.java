package cn.edu.zjut.action;

import cn.edu.zjut.po.Car;
import cn.edu.zjut.service.ICarService;

public class CarAction {
	private Car car;
	private ICarService carService;
	public String save() {
		carService.save(car);
		return "success";
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public ICarService getCarService() {
		return carService;
	}
	public void setCarService(ICarService carService) {
		this.carService = carService;
	}
	
	
}
