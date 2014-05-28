package edu.iss.ects.imp;

import java.util.Iterator;
import java.util.List;

import edu.iss.ects.entity.*;
import junit.framework.TestCase;

public class TestUser extends TestCase {

	public void testAdd() {

		Province p = new Province();
		p.setProvinceId(10);
		Country c = new Country();
		c.setCountryId(1);

		Contactinfo info = new Contactinfo();
		info.setName("bbb");
		info.setSex("男");
		info.setStreet1("安博路1号");
		info.setStreet2("兆丰路8号");
		info.setCity("武汉");
		info.setZip("223233");
		info.setEmail("23432@3423.com");
		info.setHomephone("027-6655886");
		info.setCellphone("13522663344");
		info.setOfficephone("027-5566886");
		info.setCountry(c);
		info.setProvince(p);

		User user = new User();
		user.setName("bbb");
		user.setPassword("bbb");
		user.setInfo(info);
		info.setUser(user);
		UserDAO ud = new UserDAO();

		if ((ud.findAll().size() == 0)
				|| (ud.findByName(user.getName()).size() == 0)) {
			ud.save(user);
		} else {
			System.out.println("用户名重复");
		}

	}

	public void testDelete() {

		User user = new User();
		UserDAO ud = new UserDAO();
		user = ud.findById(2);
		ud.delete(user);

	}

	public void testUpdate() {

		UserDAO ud = new UserDAO();
		User user = ud.findById(2);
		Contactinfo info = user.getInfo();
		user.setName("aaa");
		user.setPassword("aaa");
		user.setInfo(info);
		info.setUser(user);
		ud.attachDirty(user);

	}

	public void testFindByNamePwd() {

		User user = new User();
		UserDAO ud = new UserDAO();
		user = ud.findByNamePwd("aaa", "aaa");
		Contactinfo info = user.getInfo();
		System.out.println(user.getName() + " " + info.getSex() + " "
				+ info.getStreet1() + " " + info.getStreet2() + " "
				+ info.getZip() + " " + info.getEmail() + " "
				+ info.getHomephone() + " " + info.getCellphone() + " "
				+ info.getOfficephone() + " " + info.getCountry().getName()
				+ " " + info.getProvince().getName());

	}

	public void testFindByAll() {

		UserDAO ud = new UserDAO();
		List list = ud.findAll();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			User user = (User) it.next();
			System.out.println(user.getName() + " " + user.getInfo().getSex()
					+ " " + user.getInfo().getStreet1() + " "
					+ user.getInfo().getStreet2() + " "
					+ user.getInfo().getZip() + " " + user.getInfo().getEmail()
					+ " " + user.getInfo().getHomephone() + " "
					+ user.getInfo().getCellphone() + " "
					+ user.getInfo().getOfficephone() + " "
					+ user.getInfo().getCountry().getName() + " "
					+ user.getInfo().getProvince().getName());
		}

	}

}
