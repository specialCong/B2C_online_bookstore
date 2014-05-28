package edu.iss.ects.biz;

import edu.iss.ects.entity.*;
import edu.iss.ects.exception.ManagerUserException;
import edu.iss.ects.imp.UserDAO;

public class UserManagerBiz {

	private UserDAO dao = new UserDAO();

	public void addUser(User user) throws ManagerUserException {
		dao.save(user);
	}

	public User login(String name, String password) throws ManagerUserException {
		return dao.findByNamePwd(name, password);
	}

	public User findById(Integer id) throws ManagerUserException {
		return dao.findById(id);
	}

	public void modify(User user) throws ManagerUserException {
		dao.attachDirty(user);
	}

}
