package edu.iss.ects.imp;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import edu.iss.ects.entity.*;
import junit.framework.TestCase;

/**
 * @author Microwind
 * 
 */
public class TestProduct extends TestCase {

	public void testAdd() {

		Category c = new Category();
		c.setCategoryId(2);

		Product p = new Product();
		p.setName("eee");
		p.setAuthor("eee");
		p.setPublish("eee");
		p.setPages("111");
		p.setImage("\\image\\product\\2\\eee.jpg");
		p.setCategory(c);
		p.setDescription("eee");
		p.setPrice(111.1);
		ProductDAO pd = new ProductDAO();
		pd.save(p);

	}

	public void testDelete() {

		Product p = new Product();
		ProductDAO pd = new ProductDAO();
		p = pd.findById(2);
		pd.delete(p);

	}

	public void testUpdate() {

		ProductDAO pd = new ProductDAO();
		Product p = pd.findById(3);
		Category c = new Category();
		c.setCategoryId(1);
		p.setAuthor("bbb");
		p.setDescription("bbb");
		p.setName("bbb");
		p.setPrice(333.3);
		p.setPublish("bbb");
		p.setCategory(c);
		pd.attachDirty(p);

	}

	public void testFindByName() {

		List list = new ArrayList();
		ProductDAO pd = new ProductDAO();
		list = pd.findByName("aaa");
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Product p = (Product) it.next();
			System.out.println(p.getName() + " " + p.getAuthor() + " "
					+ p.getPublish() + " " + p.getPrice() + " " + p.getPages()
					+ " " + p.getImage() + " " + p.getDescription() + " "
					+ p.getCategory().getCategoryId());
		}

	}

	public void testFindByAuthor() {

		List list = new ArrayList();
		ProductDAO pd = new ProductDAO();
		list = pd.findByAuthor("bbb");
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Product p = (Product) it.next();
			System.out.println(p.getName() + " " + p.getAuthor() + " "
					+ p.getPublish() + " " + p.getPrice() + " " + p.getPages()
					+ " " + p.getImage() + " " + p.getDescription() + " "
					+ p.getCategory().getCategoryId());
		}

	}

	public void testFindById() {

		ProductDAO pd = new ProductDAO();
		Product p = pd.findById(1);
		System.out.println(p.getName() + " " + p.getAuthor() + " "
				+ p.getPublish() + " " + p.getPrice() + " " + p.getPages()
				+ " " + p.getImage() + " " + p.getDescription() + " "
				+ p.getCategory().getName());

	}

	public void testFindByAll() {

		ProductDAO pd = new ProductDAO();
		List list = pd.findAll();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Product p = (Product) it.next();
			System.out.println(p.getName() + " " + p.getAuthor() + " "
					+ p.getPublish() + " " + p.getPrice() + " " + p.getPages()
					+ " " + p.getImage() + " " + p.getDescription() + " "
					+ p.getCategory().getCategoryId());
		}

	}

}
