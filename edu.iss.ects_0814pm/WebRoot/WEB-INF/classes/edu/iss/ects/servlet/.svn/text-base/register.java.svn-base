package edu.iss.ects.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.iss.ects.entity.Contactinfo;
import edu.iss.ects.entity.Country;
import edu.iss.ects.entity.Province;
import edu.iss.ects.entity.User;
import edu.iss.ects.imp.UserDAO;

public class register extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		String truename = request.getParameter("username2");
		String adress1 = request.getParameter("street1");
		String adress2 = request.getParameter("street2");
		String city = request.getParameter("city");
		String zip = request.getParameter("zip");
		String province = request.getParameter("province");
		int provinceid = Integer.parseInt(province);
		String country = request.getParameter("country");
		int countryid = Integer.parseInt(country);
		String email = request.getParameter("email");
		String homephone = request.getParameter("homephone");
		String cellphome = request.getParameter("cellphone");
		String officephone = request.getParameter("officephone");
		String sex = request.getParameter("sex");

		List user = new ArrayList();
		UserDAO ud = new UserDAO();
		user = ud.findByName(name);

		if (user != null && user.size() == 0) {
			Province p1 = new Province();
			p1.setProvinceId(provinceid);
			Country c1 = new Country();
			c1.setCountryId(countryid);

			Contactinfo info1 = new Contactinfo();
			info1.setName(name);
			info1.setCellphone(cellphome);
			info1.setCity(city);
			info1.setEmail(email);
			info1.setHomephone(homephone);
			info1.setOfficephone(officephone);
			info1.setSex(sex);
			info1.setStreet1(adress1);
			info1.setStreet2(adress2);
			info1.setZip(zip);
			info1.setCountry(c1);
			info1.setProvince(p1);

			User u1 = new User();
			u1.setName(name);
			u1.setPassword(pwd);
			u1.setInfo(info1);
			info1.setUser(u1);

			ud.save(u1);
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
		} else {
			request.setAttribute("errorMessage", "用户名已存在，请重新输入");
			request.getRequestDispatcher("register.jsp").forward(request,
					response);
		}
	}

}
