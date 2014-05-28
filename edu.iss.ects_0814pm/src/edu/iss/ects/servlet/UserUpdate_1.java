package edu.iss.ects.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.iss.ects.imp.UserDAO;
import edu.iss.ects.entity.*;


public class UserUpdate_1 extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		UserDAO ud = new UserDAO();
		User user = ud.findById(Integer.parseInt(request.getParameter("id")));
		Contactinfo info = user.getInfo();
		Country c=new Country();
		Province p=new Province();
		user.setPassword(request.getParameter("password"));
		info.setCellphone(request.getParameter("cellphone"));
		info.setCity(request.getParameter("city"));
		info.setEmail(request.getParameter("email"));
		info.setHomephone(request.getParameter("homephone"));
		info.setOfficephone(request.getParameter("officephone"));
		info.setSex(request.getParameter("sex"));
		info.setStreet1(request.getParameter("street1"));
		info.setStreet2(request.getParameter("street2"));
		info.setZip(request.getParameter("zip"));
		p.setProvinceId(Integer.parseInt(request.getParameter("province")));
		c.setCountryId(Integer.parseInt(request.getParameter("country")));
		
		user.setInfo(info);
		info.setUser(user);
		info.setCountry(c);
		info.setProvince(p);
		ud.attachDirty(user);
		request.getRequestDispatcher("userUpdate").forward(request, response);
	}

}
