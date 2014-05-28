package edu.iss.ects.biz;

import java.util.Collection;
import edu.iss.ects.entity.*;
import edu.iss.ects.exception.ManagerOrderException;
import edu.iss.ects.imp.OrdersDAO;

public class OrderBiz {

	private OrdersDAO dao = new OrdersDAO();

	public void addOrder(Orders order) throws ManagerOrderException {
		dao.save(order);
	}

	public Collection findAll(Integer user_id) throws ManagerOrderException {
		return dao.findByUserId(user_id);
	}

	public Orders findById(Integer id) throws ManagerOrderException {
		return dao.findById(id);
	}

}
