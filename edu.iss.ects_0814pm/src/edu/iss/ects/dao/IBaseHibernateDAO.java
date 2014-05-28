package edu.iss.ects.dao;

import org.hibernate.Session;

public interface IBaseHibernateDAO {

	public Session getSession();

	public void closeSession();

}