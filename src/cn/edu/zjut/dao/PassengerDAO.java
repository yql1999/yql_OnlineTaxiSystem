package cn.edu.zjut.dao;

import java.util.ArrayList;
import java.util.Iterator;

import javax.persistence.Query;
import javax.sound.sampled.LineListener;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import antlr.collections.List;
import cn.edu.zjut.po.Driver;
import cn.edu.zjut.po.Order;
import cn.edu.zjut.po.Passenger;

public class PassengerDAO extends BaseHibernateDAO implements IPassengerDAO {

	public PassengerDAO() {
		System.out.println("create PassengerDao.");
	}

	public void save(Passenger transientInstance) {
		Transaction tran = null;
		Session session = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.save(transientInstance);
			tran.commit();
		} catch (RuntimeException re) {
			if (tran != null)
				tran.rollback();
			throw re;
		} finally {
			session.close();
		}
	}

	public Passenger findbyaccount(Passenger transientInstance) {
		try {
			String account = transientInstance.getAccount();
			String hql = "from Passenger as user where account='" + account + "'";
			// String queryString=hql+transientInstance.getAccount();
			Query queryObject = getSession().createQuery(hql);
			return (Passenger) queryObject.getResultList().get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Passenger findbyId(int id) {
		try {
			String hql = "from Passenger as user where passengerID=";
			String queryString = hql + id;
			Query queryObject = getSession().createQuery(queryString);
			return (Passenger) queryObject.getResultList().get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void update(Passenger passenger) {
		Transaction tx = null;
		Session session = null;
		try {
			session = getSession();
			tx = session.beginTransaction();
			// Passenger p = session.get(Passenger.class, passenger.getPassengerID());
			// p.setNickname(passenger.getNickname());
			// p.setPassword(passenger.getPassword());
			session.update(passenger);
			tx.commit();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Passenger select(Passenger passenger) {
		try {
			String hql = "from Passenger where passengerID=";
			hql += passenger.getPassengerID();
			Query queryObject = getSession().createQuery(hql);
			return (Passenger) queryObject.getResultList().get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Driver driverInformation(Order order) {
		try {
			String hql = "from Order where OrderID="+order.getOrderID();
			Query queryObject = getSession().createQuery(hql);
			Driver driver = ((Order) queryObject.getResultList().get(0)).getDriver();
			return driver;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Order> allOrder(Passenger passenger) {
		try {
			passenger = (Passenger) ActionContext.getContext().getSession().get("passenger");
			String hql = "from Order where passengerID=" + passenger.getPassengerID();
			return (ArrayList<Order>) getSession().createQuery(hql).list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public Order currOrder(Passenger passenger) {
		try {
			Passenger passenger2 = (Passenger) ActionContext.getContext().getSession().get("passenger");
			String hql = "from Order where passengerID=" + passenger2.getPassengerID() + "order by orderID desc";
			ArrayList<Order> orders = (ArrayList<Order>) getSession().createQuery(hql).list();
			return orders.get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void addOrder(Order order) {
		// TODO Auto-generated method stub

	}
	public void deleteOrder(Order order) {
		// TODO Auto-generated method stub

	}

	public void estimate(Driver driver) {
		// TODO Auto-generated method stub

	}

	public void pay(Passenger passenger) {
		// TODO Auto-generated method stub

	}
}
