package cn.edu.zjut.action;

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
	private Order order;
	private IOrderService orderService;
	private IPassengerService passengerService;
	private IDriverService driverService;
	private List orders;
	private Double longitude;
	private Double latitude;
	private Double length;
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
		int i=order.getPassenger().getPassengerID();
		Passenger p=new Passenger();
		p=passengerService.findbyId(i);
		order.setPassenger(p);
		order.setIsCompleted(1);
		orderService.update(order);
		//System.out.println("ordertake"+" "+order.getPassenger().getNickname());
		return "success";
	}
	
	public String findorders() {
		System.out.println("findorders method start");
		orders=orderService.findorders();
		System.out.println("Item Action executed!");

		/*Iterator<List> it=orders.iterator();
		Order t=new Order();
		while(it.hasNext()) {
			t=(Order)it.next();
			System.out.println(t.getOrderID());
			System.out.println(t.getStart());
			System.out.println(t.getDestination());
			System.out.println(t.getPassenger().getNickname());		
		}*/
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
		return "success";
	}
	
	public String setlocation() {
		order.setDriver(driverService.findbyId(order.getDriver()));
		order.getDriver().setLatitude(latitude);
		order.getDriver().setLongitude(longitude);
		System.out.println(order.getDriver().getAccount());
		driverService.update(order.getDriver());
		return "success";
	}
	//获取精确到秒的时间戳  
	public static int getSecondTimestamp(Date date){  
	    if (null == date) {  
	        return 0;  
	    }  
	    String timestamp = String.valueOf(date.getTime());  
	    int length = timestamp.length();  
	    if (length > 3) {  
	        return Integer.valueOf(timestamp.substring(0,length-3));  
	    } else {  
	        return 0;  
	    }  
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
	
}
