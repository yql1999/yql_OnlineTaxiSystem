package cn.edu.zjut.action;

import java.util.List;

import cn.edu.zjut.po.*;
import cn.edu.zjut.service.*;



public class ManagerAction {
	private Manager loginManager;
	private IManagerService managerService=null;
	private IPassengerService passengerService=null;
	private IDriverService driverService=null;
	private ICarService carService=null;
	//private IPassengerService passengerService=null;
	private Passenger pass;
	private Driver driv;
	private Car car;
	private List <Passenger> passenger;

	private List <Driver> driver;
	private List <Order> order;

	
	public ManagerAction() {
		System.out.println("create ManagerAction.");
	}
	
	public String register() {
		managerService.register(loginManager);
		return "success";
	}
	public String login() {
		if(managerService.login(loginManager))
			return "success";
		return "fail";
	}
	public String findPassenger() {
		passenger=managerService.findPassengerByHql();
		System.out.println(passenger.get(0).getAge());
		System.out.println("passenger Action executed!");
		return "success";
	}
	public String findDriver() {
		driver=managerService.findDriverByHql();
		System.out.println(driver.get(0).getAge());
		System.out.println("driver Action executed!");
		return "success";
	}
	public String findOrder() {
		order=managerService.findOrderByHql();
		System.out.println(order.get(0).getPassenger().getPassengerID());
		System.out.println("order Action executed!");
		return "success";
	}
	public String deletePassenger() {
		pass=passengerService.findbyId(pass.getPassengerID());
		System.out.println("pass:"+pass);
		managerService.deletepassenger(pass);
		return "success";
	}
	public String deleteDriver() {
		System.out.println("driv:"+driv.getDriverID());
		car=carService.findbyId(car.getCarID());
		driv=driverService.findbyId(driv);
		managerService.deletedriver(driv,car);
		return "success";
	}
	
	public Manager getLoginManager() {
		return loginManager;
	}

	public void setLoginManager(Manager loginManager) {
		this.loginManager = loginManager;
	}

	public List<Passenger> getPassenger() {
		return passenger;
	}

	public void setPassenger(List<Passenger> passenger) {
		this.passenger = passenger;
	}
	public List<Driver> getDriver() {
		return driver;
	}

	public void setDriver(List<Driver> driver) {
		this.driver = driver;
	}
	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
	}

	public Manager getLoginUser() {
		return loginManager;
	}
	public void setLoginUser(Manager loginUser) {
		this.loginManager = loginUser;
	}
	public IManagerService getManagerService() {
		return managerService;
	}
	public void setManagerService(IManagerService userService) {
		this.managerService=userService;
	}

	public IPassengerService getPassengerService() {
		return passengerService;
	}

	public void setPassengerService(IPassengerService passengerService) {
		this.passengerService = passengerService;
	}

	public Passenger getPass() {
		return pass;
	}

	public void setPass(Passenger pass) {
		this.pass = pass;
	}

	public IDriverService getDriverService() {
		return driverService;
	}

	public void setDriverService(IDriverService driverService) {
		this.driverService = driverService;
	}

	public Driver getDriv() {
		return driv;
	}

	public void setDriv(Driver driv) {
		this.driv = driv;
	}

	public ICarService getCarService() {
		return carService;
	}

	public void setCarService(ICarService carService) {
		this.carService = carService;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
	
}
