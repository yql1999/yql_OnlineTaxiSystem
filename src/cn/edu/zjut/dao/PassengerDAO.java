package cn.edu.zjut.dao;



import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;


import cn.edu.zjut.po.Passenger;

public class PassengerDAO extends BaseHibernateDAO implements IPassengerDAO {
	
		public PassengerDAO() {
			System.out.println("create PassengerDao.");
		}
		public void save(Passenger transientInstance){
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
		public Passenger findbyaccount(Passenger transientInstance) {
			try {
				String hql="from Passenger as user where account=";
				String queryString=hql+transientInstance.getAccount();
				Query queryObject=getSession().createQuery(queryString);
				return (Passenger)queryObject.getResultList().get(0);
			}catch(RuntimeException re) {
				throw re;
			}
		}
		public Passenger findbyId(Passenger transientInstance) {
			try {
				String hql="from Passenger as user where passengerID=";
				String queryString=hql+transientInstance.getPassengerID();
				Query queryObject=getSession().createQuery(queryString);
				return (Passenger)queryObject.getResultList().get(0);
			}catch(RuntimeException re) {
				throw re;
			}
		}
}
