/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package edu.iss.ects.strust.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import edu.iss.ects.entity.Contactinfo;

/** 
 * 希望在  注册、登录页面中都使用该  form 封装数据
 */
public class UserForm extends ActionForm {
	 



	private Contactinfo info; 

	


	public Contactinfo getInfo() {
		return info;
	}

	public void setInfo(Contactinfo info) {
		this.info = info;
	}

	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		//验证部分
		System.out.println("UserForm  validate ..............");
		System.out.println("city ="+this.getInfo().getCity());
		System.out.println("Steet1 ="+this.getInfo().getStreet1());
		System.out.println("email ="+this.getInfo().getEmail());
		
		
		
		return null;
	}

	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		
	}
}