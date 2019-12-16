package cn.edu.zjut.po;

import java.util.Date;

public class Order {
	private int orderID;
	private String start;
	private String destination;
	private Date starttime;
	private Date endtime;
	//private int passengerID;
	private Passenger passenger;
	//private int driverID;
	//private int carID;
	private Driver driver;
	private int passnum;
	private String type;
	private Double sum;
	private Double estimateptod;
	private Double estimatedtop;
	
	public Double getSum() {
		return sum;
	}

	public void setSum(Double sum) {
		this.sum = sum;
	}

	public Order() {}
	
	public Order(int orderID) {
		this.setOrderID(orderID);
	}
	
	public Order(int orderID, String start, String destination, Date starttime, Date endtime, int passnum, String type, double sum, Driver driver, Passenger passenger, double estimateptod, double estimatedtop) {
		this.setOrderID(orderID);
		this.setStart(start);
		this.setDestination(destination);
		this.setStarttime(starttime);
		this.setEndtime(endtime);
		//this.setPassengerID(passengerID);
		//this.setDriverID(driverID);
		//this.setCarID(carID);
		this.setPassnum(passnum);
		this.setType(type);
		this.sum = sum;
		this.setDriver(driver);
		this.setPassenger(passenger);
		this.setEstimatedtop(estimatedtop);
		this.setEstimateptod(estimateptod);
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public Passenger getPassenger() {
		return passenger;
	}

	public void setPassenger(Passenger passenger) {
		this.passenger = passenger;
	}

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	public int getPassnum() {
		return passnum;
	}

	public void setPassnum(int passnum) {
		this.passnum = passnum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getEstimateptod() {
		return estimateptod;
	}

	public void setEstimateptod(Double estimateptod) {
		this.estimateptod = estimateptod;
	}

	public Double getEstimatedtop() {
		return estimatedtop;
	}

	public void setEstimatedtop(Double estimatedtop) {
		this.estimatedtop = estimatedtop;
	}

	
}
