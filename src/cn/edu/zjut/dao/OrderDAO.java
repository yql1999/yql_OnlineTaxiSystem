package cn.edu.zjut.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.Order;

public class OrderDAO extends BaseHibernateDAO implements IOrderDAO {
	public OrderDAO() {
		System.out.println("create OrderDao.");
	}
	public void save(Order transientInstance){
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
			String hql="from Order as user where account=";
			String queryString=hql+transientInstance.getOrderID();
			Query queryObject=getSession().createQuery(queryString);
			return (Order)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
	public List all() {
		
		try {
			String queryString ="from Order as user";
			Query queryObject =getSession().createQuery(queryString);
			return queryObject.getResultList();
		}catch(RuntimeException re) {
			throw re;
		}
	}
}
