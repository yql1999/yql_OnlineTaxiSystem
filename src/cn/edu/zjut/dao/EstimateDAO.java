package cn.edu.zjut.dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.Estimate;

public class EstimateDAO extends BaseHibernateDAO implements IEstimateDAO{
	public EstimateDAO() {
		System.out.println("create EstimateDao.");
	}
	public void save(Estimate transientInstance){
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
	public Estimate findbyId(Estimate transientInstance) {
		try {
			String hql="from Estimate as user where account=";
			String queryString=hql+transientInstance.getEstimateID();
			Query queryObject=getSession().createQuery(queryString);
			return (Estimate)queryObject.getResultList().get(0);
		}catch(RuntimeException re) {
			throw re;
		}
	}
}
