package edu.iss.ects.strust.action;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.actions.MappingDispatchAction;

import edu.iss.ects.biz.ProductBiz;

import edu.iss.ects.entity.Entity;
import edu.iss.ects.entity.Product;
import edu.iss.ects.exception.ManagerProductException;
import edu.iss.ects.imp.ProductDAO;
import edu.iss.ects.util.PageController;
import edu.iss.ects.util.PageForm;

public class ProductAction  extends DispatchAction{

	private  ProductBiz  biz = new ProductBiz();
	/*
	 * ****************************************************************************
	 * 得到所有产品的列表，根据页面参数进行分页，
	 * 采用 MySql 的 Limit 属性进行分页
	 * ****************************************************************************
	 */
	public ActionForward findAll(ActionMapping mapping, ActionForm form,
			javax.servlet.http.HttpServletRequest request,
			javax.servlet.http.HttpServletResponse response)
			throws java.lang.Exception {
		
		try{
			PageForm  form1 = (PageForm)form;
			
			//判断当前页数，如果当前页是初始值，代表第一次访问，
			//应该访问 第 1 页
			if(form1.getCurrentPageNo()<=0){
				form1.setCurrentPageNo(1);
			}
			
			//根据数据库中数据总数，判断所有结果显示的总页数
			//如果总页数太小，设初始值为 1
			if(form1.getToPageNo()<=0){
				form1.setToPageNo(1);
			}
			
			int   total = biz.getTotal();
			System.out.println("得到商品总数"+total);
			
			PageController pc = new PageController(total, form1.getToPageNo());
			
			Collection list = biz.find(pc.getPageStartRow(), pc.getPageSize());
			System.out.println("得到商品列表list"+list);
			
			pc.setData(list);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("pageController", pc);
	
			session.setAttribute("plist", list);
			
		}catch(Exception e){
			e.printStackTrace();
			//return mapping.findForward("error");
		}
		return mapping.findForward("list");
	}
	
	/**
	 * 根据 id 查询产品明细的方法
	 * @throws ManagerProductException 
	 */
	public ActionForward findById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ManagerProductException {
		String pid = request.getParameter("prodId");
		int prodId  = Integer.parseInt(pid);
		
		//根据产品 id 查询产品明细
		ProductDAO pdi=new ProductDAO();
		Product p = (Product) pdi.findById(prodId);
		HttpSession session = request.getSession();
		//把查询的产品对象，传递给产品明细页面
		session.setAttribute("details", p);
		
		//Struts 中的 mapping 跳转，实际上是封装了 request 跳转的
		return mapping.findForward("detail");
	}
	
	/**
	 * 根据 name 查询产品
	 * @throws ManagerProductException 
	 */
	public ActionForward findByName(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) 
		throws ManagerProductException {
		try{
			PageForm  form1 = (PageForm)form;
			
			//判断当前页数，如果当前页是初始值，代表第一次访问，
			//应该访问 第 1 页
			if(form1.getCurrentPageNo()<=0){
				form1.setCurrentPageNo(1);
			}
			
			//根据数据库中数据总数，判断所有结果显示的总页数
			//如果总页数太小，设初始值为 1
			if(form1.getToPageNo()<=0){
				form1.setToPageNo(1);
			}
			
			String pName = request.getParameter("pName");
			int   total = biz.getNTotal(pName);
			
			PageController pc = new PageController(total, form1.getToPageNo());
			
			Collection list = biz.nFind(pName, pc.getPageStartRow(), pc.getPageSize());
			
			pc.setData(list);
			
			HttpSession session = request.getSession();
			
			request.setAttribute("pageController", pc);
	
			request.setAttribute("plist", list);
			
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("list");
	}
	
	/**
	 * 根据 author 查询产品
	 * @throws ManagerProductException 
	 */
	public ActionForward findByAuthor(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) 
		throws ManagerProductException {
		try{
			PageForm  form1 = (PageForm)form;
			
			//判断当前页数，如果当前页是初始值，代表第一次访问，
			//应该访问 第 1 页
			if(form1.getCurrentPageNo()<=0){
				form1.setCurrentPageNo(1);
			}
			
			//根据数据库中数据总数，判断所有结果显示的总页数
			//如果总页数太小，设初始值为 1
			if(form1.getToPageNo()<=0){
				form1.setToPageNo(1);
			}
			
			String pName = request.getParameter("pName");
			int   total = biz.getATotal(pName);
			
			PageController pc = new PageController(total, form1.getToPageNo());
			
			Collection list = biz.aFind(pName, pc.getPageStartRow(), pc.getPageSize());
			
			pc.setData(list);
			
			HttpSession session = request.getSession();
			
			request.setAttribute("pageController", pc);
	
			request.setAttribute("plist", list);
			
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("list");
	}
	
	/**
	 * 根据 publish 查询产品
	 * @throws ManagerProductException 
	 */
	public ActionForward findByPublish(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) 
		throws ManagerProductException {
		try{
			PageForm  form1 = (PageForm)form;
			
			//判断当前页数，如果当前页是初始值，代表第一次访问，
			//应该访问 第 1 页
			if(form1.getCurrentPageNo()<=0){
				form1.setCurrentPageNo(1);
			}
			
			//根据数据库中数据总数，判断所有结果显示的总页数
			//如果总页数太小，设初始值为 1
			if(form1.getToPageNo()<=0){
				form1.setToPageNo(1);
			}
			
			String pName = request.getParameter("pName");
			int   total = biz.getPTotal(pName);
			
			PageController pc = new PageController(total, form1.getToPageNo());
			
			Collection list = biz.pFind(pName, pc.getPageStartRow(), pc.getPageSize());
			
			pc.setData(list);
			
			HttpSession session = request.getSession();
			
			request.setAttribute("pageController", pc);
	
			request.setAttribute("plist", list);
			
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("list");
	}
}
