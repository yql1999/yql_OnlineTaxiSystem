package cn.edu.zjut.dao;

import javax.persistence.Query;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.Passenger;
import cn.edu.zjut.service.DriverService;


public class OrderDAO extends BaseHibernateDAO implements IOrderDAO {
	public OrderDAO() {
		System.out.println("create OrderDao.");
	}
	public  void save(Order transientInstance){
		Transaction tran=null;
		Session session=null;
		try {
			session=getSession();
			tran=session.beginTransaction();
			session.save(transientInstance);
			tran.commit();
		}catch(RuntimeException re)
		{
			if(tran!=null)tran.rollback();
			throw re;
		}finally {
			session.close();
		}
	}
	public Order findbyId(Order transientInstance) {
		try {
			String hql="from Order as user where orderID=";
			String queryString=hql+transientInstance.getOrderID();
			Query queryObject=getSession().createQuery(queryString);
			return (Order)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
	public void update(Order transientInstance) {
		Transaction tran=null;
		Session session=null;
		try {
			session=getSession();
			tran=session.beginTransaction();
			session.update(transientInstance);
			tran.commit();
		}catch(RuntimeException re)
		{
			if(tran!=null)tran.rollback();
			throw re;
		}finally {
			session.close();
		}
	}
	
	public List findorders(String hql) {
		try {
			System.out.println("finding orders by hql");
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString); 
			return queryObject.getResultList();
		} catch (RuntimeException re) {
			System.out.println("finding orders by hql failed");
			throw re;
		}
	}
	public void cancel(Order order) {
		Transaction tran=null;
		Session session=null;
			session=getSession();
			tran=session.beginTransaction();
			int i=order.getPassenger().getPassengerID();
			List<Order> orders=findorders("from Order as user where passengerID="+i);
			for(int j=0;j<orders.size();j++) {
			Order example=orders.get(j);

	 		if(example.getIsEstimatedP()==false) {			session.delete(example);
			 }
			}
			tran.commit();
	}
	public void deleteorder(Order order) {
		Transaction tran=null;
		Session session=null;
			session=getSession();
			tran=session.beginTransaction();
			int i=order.getPassenger().getPassengerID();
			List<Order> orders=findorders("from Order as user where passengerID="+i);
			for(int j=0;j<orders.size();j++) {
			Order example=orders.get(j);
			
 			if(example.getIsEstimatedP()==false) {			
 				session.delete(example);
			 }
			}
			int k=order.getDriver().getDriverID();
			List<Order> driverorders=findorders("from Order as user where driverID="+k);
			int size=driverorders.size();
			Driver driver=new Driver();
			driver.setDriverID(k);
			String hql="from Driver as user where driverID=";
			String queryString=hql+driver.getDriverID();
			System.out.println(queryString);
			Query queryObject=session.createQuery(queryString);
			driver=(Driver)queryObject.getResultList().get(0);
			double score=(driver.getScore()*size+order.getEstimateptod())/(size+1);
			driver.setScore(score);
			session.update(driver);
			tran.commit();
	}
	public void appraise(Order order) {
		Transaction tran=null;
		Session session=null;
		session=getSession();
		tran=session.beginTransaction();
		int k=order.getDriver().getDriverID();
		List<Order> driverorders=findorders("from Order as user where driverID="+k);
		int size=driverorders.size();
		Driver driver=new Driver();
		driver.setDriverID(k);
		String hql="from Driver as user where driverID=";
		String queryString=hql+driver.getDriverID();
		Query queryObject=session.createQuery(queryString);
		driver=(Driver)queryObject.getResultList().get(0);
		double score=(driver.getScore()*size+order.getEstimateptod())/(size+1); 
		driver.setScore(score);
		int id=driver.getDriverID();
		Driver example=session.load(Driver.class,id);
		session.update(example);
		
		double score1=order.getEstimateptod();
		String hql1="from Order as user where orderID=";
		String queryString1=hql1+order.getOrderID();
		Query queryObject1=session.createQuery(queryString1);
		order=(Order)queryObject1.getResultList().get(0);
        order.setDestination(order.getDestination());
        order.setStart(order.getStart());
        order.setSum(order.getSum());
		order.setEstimateptod(score1);
		order.setIsCompleted(2);
		order.setIsEstimatedP(true);		
		session.update(order);
		tran.commit();
	}
public void appraise2(Order order) {
		Transaction tran=null;
		Session session=null;
		session=getSession();
		tran=session.beginTransaction();
		int k=order.getPassenger().getPassengerID();
		List<Order> passengerorders=findorders("from Order as user where passengerID="+k);
		int size=passengerorders.size();
		Passenger passenger = new Passenger();
		passenger.setPassengerID(k);
		String hql="from Passenger as user where passengerID=";
		String queryString=hql+passenger.getPassengerID();
		Query queryObject=session.createQuery(queryString);
		passenger=(Passenger)queryObject.getResultList().get(0);
		double score=(passenger.getScore()*size+order.getEstimateptod())/(size+1); 
		passenger.setScore(score);
		int id=passenger.getPassengerID();
		Passenger example=session.load(Passenger.class,id);
		session.update(example);
		
		double score1=order.getEstimateptod();
		String hql1="from Order as user where orderID=";
		String queryString1=hql1+order.getOrderID();
		Query queryObject1=session.createQuery(queryString1);
		order=(Order)queryObject1.getResultList().get(0);
        order.setDestination(order.getDestination());
        order.setStart(order.getStart());
        order.setSum(order.getSum());
		order.setEstimateptod(score1);
		order.setIsCompleted(2);
		order.setIsEstimatedP(true);		
		session.update(order);
		tran.commit();
	}
}
