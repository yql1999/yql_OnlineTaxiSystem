package cn.edu.zjut.dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.Driver;


public class DriverDAO extends BaseHibernateDAO implements IDriverDAO{
	public DriverDAO() {
		System.out.println("create DriverDao.");
	}
	public void save(Driver transientInstance){
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
	public Driver findbyaccount(Driver transientInstance) {
		try {
			String account = transientInstance.getAccount();
			String hql="from Driver as user where account='"+account+"'";
			Query queryObject=getSession().createQuery(hql);
			return (Driver)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
	public Driver findbyId(Driver transientInstance) {
		try {
			String hql="from Driver as user where driverID=";
			String queryString=hql+transientInstance.getDriverID();
			Query queryObject=getSession().createQuery(queryString);
			return (Driver)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
	public void update(Driver transientInstance) {
		Transaction tran=null;
		Session session=null;
		try {
			session=getSession();
			tran=session.beginTransaction();
			session.merge(transientInstance);
			tran.commit();
		}catch(RuntimeException re)
		{
			if(tran!=null)tran.rollback();
			throw re;
		}finally {
			session.close();
		}
	}
}
