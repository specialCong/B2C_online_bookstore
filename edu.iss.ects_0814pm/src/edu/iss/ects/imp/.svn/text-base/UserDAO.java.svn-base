package edu.iss.ects.imp;

import edu.iss.ects.entity.User;

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
public class UserDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(UserDAO.class);
	public static final String NAME = "name";
	public static final String PASSWORD = "password";

	public void save(User transientInstance) {
		log.debug("saving User instance");
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

	public void delete(User persistentInstance) {
		log.debug("deleting User instance");
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

	public User findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) getSession().get("edu.iss.ects.entity.User",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public User findByNamePwd(String name, String password) {
		User instance = null;
		try {
			String queryString = "from User as model where name=:nn and password=:pp";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setString("nn", name);
			queryObject.setString("pp", password);
			instance = (User) queryObject.uniqueResult();
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding User instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from User as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		} finally {
			this.closeSession();
		}
	}

	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
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