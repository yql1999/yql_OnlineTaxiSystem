package cn.edu.zjut.dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.Manager;
import cn.edu.zjut.po.Passenger;


public class ManagerDAO extends BaseHibernateDAO implements IManagerDAO{
	public ManagerDAO() {
		System.out.println("create ManagerDao.");
	}
	public void save(Manager transientInstance){
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
	public Manager findbyaccount(Manager transientInstance) {
		try {
			String account = transientInstance.getAccount();
			String hql="from Manager as user where account='"+account+"'";
			Query queryObject=getSession().createQuery(hql);
			return (Manager)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
	public Manager findbyId(int id) {
		try {
			String hql="from Manager as user where managerID=";
			String queryString=hql+id;
			Query queryObject=getSession().createQuery(queryString);
			return (Manager)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
}
