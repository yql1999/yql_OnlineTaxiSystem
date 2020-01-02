package cn.edu.zjut.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.hibernate.Transaction;
import com.opensymphony.xwork2.ActionContext;
import cn.edu.zjut.dao.*;
import cn.edu.zjut.po.*;



public class ManagerService implements IManagerService{
	private IManagerDAO managerDAO=null;
	private IPassengerDAO passengerDAO=null;
	private List items = new ArrayList();
	public ManagerService() {
		System.out.println("create managerService.");
	}
	
	public void register(Manager transientInstance) {
		System.out.println("execute--register()--method.");
		managerDAO.save(transientInstance);
	}
	public Boolean login(Manager transientInstance) {
		Manager temp=managerDAO.findbyaccount(transientInstance);
		if(transientInstance.getPassword().equals(temp.getPassword())) {
			return true;
		}
		return false;
	}
	public Manager findbyId(int id) {
		System.out.println("before Manager findbyId");
		Manager temp=managerDAO.findbyId(id);
		System.out.println("after Manager findbyId");
		return temp;
	}
	public void deletepassenger(Passenger transientInstance) {
		//System.out.println("before Manager findbyId");
		//Manager temp=managerDAO.findpassengerbyId(id);
		managerDAO.deletepassenger(transientInstance);
		//System.out.println("temp"+temp);
		
	}
	public void deletedriver(Driver transientInstance,Car s) {
		managerDAO.deletedriver(transientInstance,s);
	}
//	public void deletecar(Car transientInstance) {
//		//System.out.println("before Manager findbyId");
//		//Manager temp=managerDAO.findpassengerbyId(id);
//		managerDAO.deletecar(transientInstance);
//		//System.out.println("temp"+temp);
//		
//	}
	
	public List findPassengerByHql() {
		String hql="from Passenger";
		List list = managerDAO.findByHql(hql);
		return list;
	}
	public List findDriverByHql() {
		String hql="from Driver";
		List list = managerDAO.findByHql(hql);
		return list;
	}
	public List findOrderByHql() {
		String hql="from Order";
		List list = managerDAO.findByHql(hql);
		return list;
	}
	
	public IManagerDAO getManagerDAO() {
		return managerDAO;
	}
	public void setManagerDAO(IManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

}

