package cn.edu.zjut.dao;

import java.util.List;

import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.*;

public class ManagerDAO extends BaseHibernateDAO implements IManagerDAO {
	public ManagerDAO() {
		System.out.println("create ManagerDao.");
	}

	public void save(Manager transientInstance) {
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

	public void deletepassenger(Passenger transientInstance) {
		Transaction tran = null;
		Session session = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.delete(transientInstance);
			tran.commit();
		} catch (RuntimeException re) {
			if (tran != null)
				tran.rollback();
			throw re;
		} finally {
			session.close();
		}
	}

	public void deletedriver(Driver transientInstance,Car s) {
		Transaction tran = null;
		Session session = null;
		session = getSession();
		tran = session.beginTransaction();
		String hql="from Driver as user where driverID=";
		String hql1="from Car as user where carID=";
		String queryString=hql+transientInstance.getDriverID();
		String queryString1=hql1+s.getCarID();
		Query queryObject=session.createQuery(queryString);
		Query queryObject1=session.createQuery(queryString1);
		transientInstance=(Driver)queryObject.getResultList().get(0);
		s=(Car)queryObject1.getResultList().get(0);
		session.delete(s);
		session.delete(transientInstance);
		tran.commit();
		session.close();
	}
//	public void deletecar(Car transientInstance){
//		Transaction tran=null;
//		Session session=null;
//		try {
//			session=getSession();
//			tran=session.beginTransaction();
//			session.delete(transientInstance);
//			tran.commit();
//		}catch(RuntimeException re)
//		{
//			if(tran!=null)tran.rollback();
//			throw re;
//		}finally {
//			session.close();
//		}
//	}
	public Manager findbyaccount(Manager transientInstance) {
		try {
			String account = transientInstance.getAccount();
			String hql = "from Manager as user where account='" + account + "'";
			Query queryObject = getSession().createQuery(hql);
			return (Manager) queryObject.getResultList().get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Manager findbyId(int id) {
		try {
			String hql = "from Manager as user where managerID=";
			String queryString = hql + id;
			Query queryObject = getSession().createQuery(queryString);
			return (Manager) queryObject.getResultList().get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Manager findpassengerbyId(int id) {
		try {
			String hql = "DELETE FROM Passenger WHERE passengerID=";
			String queryString = hql + id;
			Query queryObject = getSession().createQuery(queryString);
			return (Manager) queryObject.getResultList().get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByHql(String hql) {
		try {
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString);
			return ((org.hibernate.query.Query) queryObject).list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

}
