package cn.edu.zjut.dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.*;

public class CarDAO extends BaseHibernateDAO implements ICarDAO{
	public CarDAO() {
		System.out.println("create CarDao.");
	}
	public void save(Car transientInstance){
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
	public Car findbyId(int id) {
		try {
			String hql="from Car as user where carID=";
			String queryString = hql + id;
			Query queryObject = getSession().createQuery(queryString);
			return (Car)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
}
