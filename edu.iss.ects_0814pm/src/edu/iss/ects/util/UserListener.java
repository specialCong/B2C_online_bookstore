package edu.iss.ects.util;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import edu.iss.ects.entity.ShopCart;
import edu.iss.ects.entity.User;

public class UserListener implements HttpSessionAttributeListener {

	public void attributeAdded(HttpSessionBindingEvent event) {
		// 得到session对象
		HttpSession session = event.getSession();
		User u = null;
		if (session.getAttribute("user") != null) {
			// 如果 session 是新建的，而且里面存储了用户信息
			// 说明该用户是新登录的
			u = (User) session.getAttribute("user");
			System.out.println("一个用户," + u.getName() + " , 登录系统了..........");
	
		
		} else {
			System.out.println("一个游客访问产品列表, 但是没有登录系统........");
		}
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

}
