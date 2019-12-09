package cn.edu.zjut.dao;

import cn.edu.zjut.po.Estimate;

public interface IEstimateDAO {
	public void save(Estimate transientInstance);
	public Estimate findbyId(Estimate transientInstance);
}
