package edu.iss.ects.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.iss.ects.entity.Entity;
import edu.iss.ects.entity.Product;
import edu.iss.ects.exception.ManagerProductException;
import edu.iss.ects.imp.ProductDAO;

public class product extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String method=request.getParameter("method");
			
			if("findAll".equals(method.trim())){
				try {
					this.doFindAll(request, response);
				} catch (ManagerProductException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if("findByName".equals(method.trim()))
			{
				try {
					this.doFindByName(request, response);
				} catch (ManagerProductException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if("findByAuthor".equals(method.trim()))
			{
				try {
					this.doFindByAuthor(request, response);
				} catch (ManagerProductException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if("findByPublish".equals(method.trim()))
			{
				try {
					this.doFindByPublish(request, response);
				} catch (ManagerProductException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}

	public void doFindAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ManagerProductException {
			System.out.println("到达  productList doFindAll ..................");
			//专门取出产品列表信息
			//得到产品列表
			ProductDAO pd=new ProductDAO();
			Collection list=pd.findAll();
			
			//把产品列表对象传递给页面  productList.jsp
			//如果把产品保存在  request 对象中传递，到达下一个页面后就失效
			//产品信息，不需要经常变化，所以需要使用  更长的有效期
			//request.setAttribute("plist", list);
			//创建 session 对象，之前已经创建过，不需要新建，直接使用已有的
			HttpSession session = request.getSession();
			System.out.println("productServlet FindAll sessionID :"+session.getId());
			session.setAttribute("plist", list);
					
			request.getRequestDispatcher("booklist.jsp").forward(request, response);
	}
	
	public void doFindById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

}

	public void doFindByName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ManagerProductException {
		
			String pName = request.getParameter("pName");
			
			System.out.println("请求到达搜索方法..................");
			System.out.println("搜索Name :"+pName);
			
			//通过获得的商品名称查询商品
			ProductDAO pd=new ProductDAO();
			Collection list=pd.findByName(pName);
			
			//把产品列表对象传递给页面  productList.jsp
			HttpSession session = request.getSession();
			System.out.println("productServlet FindByName sessionID :"+session.getId());
			session.setAttribute("plist", list);
			
			request.getRequestDispatcher("booklist.jsp").forward(request, response);
}
	
	public void doFindByAuthor(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, ManagerProductException {

	String pName = request.getParameter("pName");
	
	System.out.println("请求到达搜索方法..................");
	System.out.println("搜索Author :"+pName);
	
	//通过获得的商品名称查询商品
	ProductDAO pd=new ProductDAO();
	Collection list=pd.findByAuthor(pName);
	
	//把产品列表对象传递给页面  productList.jsp
	HttpSession session = request.getSession();
	System.out.println("productServlet findByAuthor sessionID :"+session.getId());
	session.setAttribute("plist", list);
	
	request.getRequestDispatcher("booklist.jsp").forward(request, response);
}
	
	public void doFindByPublish(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, ManagerProductException {

	String pName = request.getParameter("pName");
	
	System.out.println("请求到达搜索方法..................");
	System.out.println("搜索Publish :"+pName);
	
	//通过获得的商品名称查询商品
	ProductDAO pd=new ProductDAO();
	Collection list=pd.findByPublish(pName);
	
	//把产品列表对象传递给页面  productList.jsp
	HttpSession session = request.getSession();
	System.out.println("productServlet findByPublish sessionID :"+session.getId());
	session.setAttribute("plist", list);
	
	request.getRequestDispatcher("booklist.jsp").forward(request, response);
}

}
