package cn.edu.zjut.po;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

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
	private Boolean isEstimatedD;
	private Boolean isEstimatedP;
	private int isCompleted;//0代表未接单，1代表已接单，2代表已完成
	private Double slng;
	private Double slat;
	private Double elng;
	private Double elat;
	
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
	
	public Order(int orderID, String start, String destination, Date starttime, Date endtime, int passnum, String type, Double sum, Driver driver, Passenger passenger, Double estimateptod, Double estimatedtop,Boolean isEstimated,int isCompleted,Double slng,Double slat,Double elng,Double elat) {		this.setOrderID(orderID);
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
		this.setIsEstimatedD(isEstimatedD);		this.setIsCompleted(isCompleted);
		this.setIsEstimatedP(isEstimatedP);
		this.setSlat(slat);
		this.setSlng(slng);
		this.setElat(elat);
		this.setElng(elng);
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
	@JSON(serialize=false)
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


	public Boolean getIsEstimatedD() {
		return isEstimatedD;	}

	public void setIsEstimatedD(Boolean isEstimatedD) {
		this.isEstimatedD = isEstimatedD;	
	}



	public int getIsCompleted() {
		return isCompleted;
	}

	public void setIsCompleted(int isCompleted) {
		this.isCompleted = isCompleted;
	}

	public Boolean getIsEstimatedP() {
		return isEstimatedP;
	}

	public void setIsEstimatedP(Boolean isEstimatedP) {
		this.isEstimatedP = isEstimatedP;
	}

	public Double getSlng() {
		return slng;
	}

	public void setSlng(Double slng) {
		this.slng = slng;
	}

	public Double getSlat() {
		return slat;
	}

	public void setSlat(Double slat) {
		this.slat = slat;
	}

	public Double getElng() {
		return elng;
	}

	public void setElng(Double elng) {
		this.elng = elng;
	}

	public Double getElat() {
		return elat;
	}

	public void setElat(Double elat) {
		this.elat = elat;
	}
	
		
}
