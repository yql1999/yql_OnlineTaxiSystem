package cn.edu.zjut.po;

public class Estimate {
	private int estimateID;
	private int driverID;
	private Driver driver;
	private int passengerID;
	private Passenger passenger;
	private int orderID;
	private String content;
	
	public Estimate() {}
	
	public Estimate(int estimateID) {
		this.estimateID = estimateID;
	}
	
	public Estimate(int estimateID, int driverID, int passengerID, int orderID, String content, Driver driver, Passenger passenger) {
		this.estimateID = estimateID;
		this.driverID = driverID;
		this.passengerID = passengerID;
		this.orderID = orderID;
		this.content = content;
		this.setDriver(driver);
		this.setPassenger(passenger);
	}

	public int getEstimateID() {
		return estimateID;
	}

	public void setEstimateID(int estimateID) {
		this.estimateID = estimateID;
	}

	public int getDriverID() {
		return driverID;
	}

	public void setDriverID(int driverID) {
		this.driverID = driverID;
	}

	public int getPassengerID() {
		return passengerID;
	}

	public void setPassengerID(int passengerID) {
		this.passengerID = passengerID;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	public Passenger getPassenger() {
		return passenger;
	}

	public void setPassenger(Passenger passenger) {
		this.passenger = passenger;
	}
	
}
