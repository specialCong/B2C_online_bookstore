package edu.iss.ects.imp;

import java.util.List;

import edu.iss.ects.entity.Entity;


public interface OrderDAO {
	//添加表单
	public  void  addOrder(Entity entity);
	//按名称查询
	public  List<Entity>  findAll(String   user_name);
	//按id查询
	public  Entity  findById(Integer id);

}
