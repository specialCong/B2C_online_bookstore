package edu.iss.ects.imp;

import edu.iss.ects.entity.Entity;
import edu.iss.ects.entity.Orders;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * @author Microwind
 * 
 */
public class OrdersDAO extends BaseHibernateDAO {
	
	private static final Log log = LogFactory.getLog(OrdersDAO.class);
	public static final String COST = "cost";
	public static final String USER_ID = "userId";
	public static final String ORDERSTATUS_ID = "orderstatusId";
	public static final String PAYWAY_ID = "paywayId";
	public  void  addOrder(Entity entity) {
	}
	//按名称查询
	public  List<Entity>  findAll(String   user_name) {
		String queryString = "from Orders";
		Query queryObject = getSession().createQuery(queryString);
		return queryObject.list();
	}
	//按id查询
	
	public void save(Orders transientInstance) {
		log.debug("saving Orders instance");
		Transaction tr = null;
		Session session = null;
		try {
			session = getSession();
			tr = session.beginTransaction();
			session.save(transientInstance);
			tr.commit();
			log.debug("save successful");
		} catch (RuntimeException re) {
			tr.rollback();
			log.error("save failed", re);
			throw re;
		} finally {
			this.closeSession();
		}
	}

	public void delete(Orders persistentInstance) {
		log.debug("deleting Orders instance");
		Transaction tr = null;
		Session session = null;
		try {
			session = getSession();
			tr = session.beginTransaction();
			session.delete(persistentInstance);
			tr.commit();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			tr.rollback();
			throw re;
		} finally {
			this.closeSession();
		}
	}

	public Orders findById(java.lang.Integer id) {
		log.debug("getting Orders instance with id: " + id);
		try {
			Orders instance = (Orders) getSession().get(
					"edu.iss.ects.entity.Orders", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByOrderId(Integer orderId) {
		try {
			String queryString = "from Orderline as o where o.order.orderId= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setInteger(0, orderId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by orderId failed", re);
			throw re;
		}
	}

	public List findByUserId(Integer userId) {
		try {
			String queryString = "from Orders as o where o.user.userId= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setInteger(0, userId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by userId failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Orders instances");
		try {
			String queryString = "from Orders";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public void attachDirty(Orders instance) {
		log.debug("attaching dirty Orders instance");
		Transaction tr = null;
		Session session = null;
		try {
			session = getSession();
			tr = session.beginTransaction();
			session.saveOrUpdate(instance);
			tr.commit();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			tr.rollback();
			log.error("attach failed", re);
			throw re;
		} finally {
			this.closeSession();
		}
	}

}