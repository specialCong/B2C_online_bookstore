package edu.iss.ects.biz;

import java.util.Collection;

import edu.iss.ects.entity.*;
import edu.iss.ects.exception.ManagerProductException;
import edu.iss.ects.imp.ProductDAO;

public class ProductBiz {

	private  ProductDAO  dao  = new  ProductDAO();
	
	public  Product  findById(Integer  id )throws ManagerProductException{
		return  dao.findById(id);
	}
	public  Collection   findAll( )throws ManagerProductException{
		return dao.findAll();
	}

	public  Collection    find(int start , int  max )throws  ManagerProductException{
		return   dao.find(start,  max );
	}
	public   int  getTotal()throws ManagerProductException{
		return   dao.getTotal();
	}
	
	public   int  getNTotal(String name)throws ManagerProductException{
		return   dao.getNTotal(name);
	}
	
	public   int  getATotal(String author)throws ManagerProductException{
		return   dao.getATotal(author);
	}
	
	public   int  getPTotal(String publish)throws ManagerProductException{
		return   dao.getPTotal(publish);
	}

	public  Collection   find(Product product)throws ManagerProductException{
		return   dao.find(product);
	}
	
	public Collection findByName(String name) throws ManagerProductException{
		return dao.findByName(name);
	}
	
	public Collection findByAuthor(String author) throws ManagerProductException{
		return dao.findByAuthor(author);
	}

	public Collection findByPublish(String pub) throws ManagerProductException{
		return dao.findByPublish(pub);
	}
	
	public Collection nFind(String name,int start, int max) throws ManagerProductException {
		return dao.nFind(name, start, max);
	}
	
	public Collection aFind(String author,int start, int max) throws ManagerProductException {
		return dao.aFind(author, start, max);
	}
	
	public Collection pFind(String publish,int start, int max) throws ManagerProductException {
		return dao.pFind(publish, start, max);
	}
}
