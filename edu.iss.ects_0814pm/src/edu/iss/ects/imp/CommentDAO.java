package edu.iss.ects.imp;

import edu.iss.ects.entity.Comment;

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
public class CommentDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(CommentDAO.class);
	public static final String USER_ID = "userId";
	public static final String PRODUCT_ID = "productId";
	public static final String SCORE = "score";
	public static final String DESCRIPTION = "description";

	public void save(Comment transientInstance) {
		log.debug("saving Comment instance");
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

	public void delete(Comment persistentInstance) {
		log.debug("deleting Comment instance");
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

	public Comment findById(java.lang.Integer id) {
		log.debug("getting Comment instance with id: " + id);
		try {
			Comment instance = (Comment) getSession().get(
					"edu.iss.ects.entity.Comment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByUserId(Integer userId) {
		try {
			String queryString = "from Comment as c where c.user.userId= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setInteger(0, userId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by userId failed", re);
			throw re;
		}
	}

	public List findByProductId(Integer productId) {
		try {
			String queryString = "from Comment as c where c.product.productId= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setInteger(0, productId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by productId failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Comment instances");
		try {
			String queryString = "from Comment";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

}