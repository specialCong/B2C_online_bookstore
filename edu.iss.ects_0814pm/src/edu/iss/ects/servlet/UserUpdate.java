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

public class UserUpdate extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String name=(String)session.getAttribute("n");
		UserDAO user=new UserDAO();
		List list=user.findByName(name);
		User u=(User)list.get(0);
		Contactinfo info=u.getInfo();
		Country c=info.getCountry();
		Province p=info.getProvince();
		session.setAttribute("user1", u);
		session.setAttribute("userInfo1", info);
		session.setAttribute("country", c);
		session.setAttribute("province", p);
		request.getRequestDispatcher("userUpdate.jsp").forward(request, response);
	}

}
