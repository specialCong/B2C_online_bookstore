package edu.iss.ects.imp;

import edu.iss.ects.dao.IBaseHibernateDAO;
import edu.iss.ects.util.HibernateSessionFactory;
import org.hibernate.Session;

/**
 * Data access object (DAO) for domain model
 * 
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDAO implements IBaseHibernateDAO {

	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}

	public void closeSession() {
		HibernateSessionFactory.closeSession();
	}

}