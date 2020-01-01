package cn.edu.zjut.action;

import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.Passenger;
import cn.edu.zjut.service.IOrderService;
import cn.edu.zjut.service.IPassengerService;
import cn.edu.zjut.service.DriverService;
import cn.edu.zjut.service.IDriverService;
import cn.edu.zjut.service.ManagerService;

public class OrderAction {
	//private int testid;
	private Passenger loginUser;
	private Order order;
	private IOrderService orderService;
	private IPassengerService passengerService;
	private IDriverService driverService;
	private List orders;
	private Double longitude;
	private Double latitude;
	private Double length;
	private int orderID;
	private Double estimatedtop;
	private Boolean flag;
	public Double getLength() {
		return length;
	}

	public void setLength(Double length) {
		this.length = length;
	}

	public String save() {
		orderService.save(order);
		return "success";
	}
	
	public String ordertake() {
		//System.out.println(order.getPassenger());
		//System.out.println("ordertake  "+order.getPassenger().getPassengerID());
		//int i=order.getDriver().getDriverID()
		Driver p=new Driver();
		p=driverService.findbyId(order.getDriver());
		order=orderService.findbyId(order);
		order.setDriver(p);
		order.setIsCompleted(1);
		orderService.update(order);
		//System.out.println("ordertake"+" "+order.getPassenger().getNickname());
		return "success";
	}
	
	public String findorders() {
		//System.out.println(order.getDriver().getDriverID());
		System.out.println("findorders method start");
		orders=orderService.findorders();
		System.out.println("Item Action executed!");
		
		Iterator<List> it=orders.iterator();
		Order t=new Order();
		while(it.hasNext()) {
			t=(Order)it.next();
			if(t.getIsCompleted()!=0) {
				it.remove();
				
			}
			else {
			System.out.println(t.getSlat());
			if(getDistance(latitude,longitude,t.getSlat(),t.getSlng())/1000>10) {
				it.remove();
			}
			}
		}
		return "success";
	}
	
	public String getpassenger() {
		//仔细想了想，好像不用改什么，先放着
		order=orderService.findbyId(order);
		Date date=new Date();
		Calendar calendar = Calendar.getInstance();
        date = calendar.getTime();
        System.out.println(date);
		order.setStarttime(date);
		orderService.update(order);
		return "success";
	}
	public String cancelorder() {
		order=orderService.findbyId(order);
		order.setIsCompleted(0);
		orderService.update(order);
		orders=orderService.findorders();
		for(Order a:(List<Order>)orders) {
			System.out.println(a.getIsCompleted());
		}
		return "success";
	}
	public String findbyId() {
		//System.out.println(testid);
		//为ajax试验多的代码，可删去
		//order=new Order();
		//order.setOrderID(testid);
		//到此为止
		order=orderService.findbyId(order);
		System.out.println(order.getDriver().getDriverID());
		return "success";
	}
	
	public String arrive() {
		System.out.println(order.getOrderID());
		int iscomplete=order.getIsCompleted();
		order=orderService.findbyId(order);
		order.setIsCompleted(iscomplete);
		double sum,nowsum;
		Date date=new Date();
		Calendar calendar = Calendar.getInstance();
        date = calendar.getTime();
        System.out.println(date);
		order.setEndtime(date);
		int time = (int)(order.getEndtime().getTime() - order.getStarttime().getTime())/(1000*60);
		System.out.println("经过总时长:" + time);
		length=length/1000;
		if(order.getType().equals("优享")) {
			double startsum=13.00;
			if(length<=20) {
				nowsum=2.3*length + 0.6*time;
				if(nowsum>=startsum)
					sum=nowsum;
				else sum = startsum;
			}
			else {
				nowsum=2.3*20+0.6*time+3.3*(length-20);
				sum=nowsum;
			}
		}
		else {
			double startsum=13.00;
			if(length<=20) {
				nowsum=1.6*length+0.5*time;
				if(nowsum>=startsum)
					sum=nowsum;
				else sum = startsum;
			}
			else {
				nowsum=1.6*20+0.5*time+2.4*(length-20);
				sum=nowsum;
			}
		}

		System.out.println("总价格:" + sum);
		order.setSum(sum);
		orderService.update(order);
		orders=orderService.findorders();
		Iterator<List> it=orders.iterator();
		Order t=new Order();
		while(it.hasNext()) {
			t=(Order)it.next();
			if(t.getDriver().getDriverID()!=order.getDriver().getDriverID()) {
				it.remove();
				
			}
			else {
			System.out.println(t.getSlat());
			}
		}
		return "success";
	}
	
	public String driverEstimate(){
		order=orderService.findbyId(order);
		order.setIsEstimatedD(true);
		order.setEstimatedtop(estimatedtop);
		orderService.update(order);
		orders=orderService.findorders();
		orderService.appraise2(order);
		return "success";
	}
	
	public String findestimate() {
		orders=orderService.findorders();
		Iterator<List> it=orders.iterator();
		Order t=new Order();
		while(it.hasNext()) {
			t=(Order)it.next();
			if(t.getIsCompleted()==0) {
				it.remove();
				continue;
			}
			if(t.getDriver().getDriverID()!=order.getDriver().getDriverID()) {
				it.remove();
				
			}
			else {
			System.out.println(t.getSlat());
			}
		}
		return "success";
	}
	
	public String setlocation() {
		Order s=new Order();
		s.setOrderID(orderID);
		try {
		order=orderService.findbyId(s);		
		order.setDriver(driverService.findbyId(order.getDriver()));
		//order.setDriver(driverService.findbyId(order.getDriver()));
		order.getDriver().setLatitude(latitude);
		order.getDriver().setLongitude(longitude);
		System.out.println(order.getDriver().getAccount());
		driverService.update(order.getDriver());
		return "success";
		}
		catch(Exception e){
			flag=true;
			return "fail";
		}
	}
	public String getlocation() {
		Order s=new Order();
		s.setOrderID(orderID);
		order=orderService.findbyId(s);
		System.out.println(order.getSlat());
		return "success";
	}
	public String addorder() {
		System.out.println("action");
		Date t = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Date sqld=new java.sql.Date(t.getTime());
		order.setStarttime(sqld);
		order.setIsEstimatedP(false);
		order.setIsEstimatedD(false);		orderService.save(order);
		return"success";
	}
	public String deleteorder() {
		System.out.println("deleteaction");
		orderService.deleteorder(order);
		return "success";
	}
	public String appraise() {
		System.out.println("appraise action");
		orderService.appraise(order);
		order=orderService.findbyId(order);
		return "success";
	}
	public String toappraise() {
		System.out.println(order.getOrderID());
		order=orderService.findbyId(order);
		return "success";
	}
	public String torun() {
		order=orderService.findbyId(order);
		return "success";
	}
	public String cancel() {
		loginUser=passengerService.findbyId(order.getPassenger().getPassengerID());
		orderService.cancel(order);
		return "success";
	}
	
	public String finish() {
	return "success";
	}
	public String driverhistory() {
		orders=orderService.finddriverhistoryorders(order);
		return "success";
	}
	 public double getDistance(double lat1, double lng1,double  lat2,double lng2) {
			double earthRadius = 6367000;
			lat1 = (lat1 * Math.PI) / 180;
			lng1 = (lng1 * Math.PI) / 180;
			lat2 = (lat2 * Math.PI) / 180;
			lng2 = (lng2 * Math.PI) / 180;
			double calcLongitude = lng2 - lng1;
			double calcLatitude = lat2 - lat1;
			double stepOne = Math.pow(Math.sin(calcLatitude / 2), 2) + Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(calcLongitude / 2), 2);
			double stepTwo = 2 * Math.asin(Math.min(1, Math.sqrt(stepOne)));
			double calculatedDistance = earthRadius * stepTwo;
			System.out.println(Math.round(calculatedDistance));
			return Math.round(calculatedDistance);
	}
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	public List getOrders() {
		return orders;
	}

	public void setOrders(List orders) {
		this.orders = orders;
	}

	public IPassengerService getPassengerService() {
		return passengerService;
	}

	public void setPassengerService(IPassengerService passengerService) {
		this.passengerService = passengerService;
	}
	
	public IDriverService getDriverService() {
		return driverService;
	}

	public void setDriverService(IDriverService driverService) {
		this.driverService = driverService;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Passenger getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(Passenger loginUser) {
		this.loginUser = loginUser;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	
	public Double getEstimatedtop() {
		return estimatedtop;
	}

	public void setEstimatedtop(Double estimatedtop) {
		this.estimatedtop = estimatedtop;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}
	
}
