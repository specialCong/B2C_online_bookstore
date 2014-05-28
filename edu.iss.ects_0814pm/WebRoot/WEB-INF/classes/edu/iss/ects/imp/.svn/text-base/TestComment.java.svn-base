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
public class TestComment extends TestCase {

	public void testAdd() {

		User u = new User();
		u.setUserId(1);
		Product p = new Product();
		p.setProductId(1);
		Comment c = new Comment();
		c.setUser(u);
		c.setProduct(p);
		c.setDescription("aaa");
		c.setScore(9);
		CommentDAO cd = new CommentDAO();
		cd.save(c);

	}

	public void testDelete() {

		Comment c = new Comment();
		CommentDAO cd = new CommentDAO();
		c = cd.findById(2);
		cd.delete(c);

	}

	public void testFindByProductId() {

		List list = new ArrayList();
		CommentDAO cd = new CommentDAO();
		list = cd.findByProductId(1);
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Comment c = (Comment) it.next();
			System.out.println(c.getUser().getName() + " " + c.getDescription()
					+ " " + c.getScore());
		}

	}

	public void testFindByUserId() {

		List list = new ArrayList();
		CommentDAO cd = new CommentDAO();
		list = cd.findByUserId(1);
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Comment c = (Comment) it.next();
			System.out.println(c.getProduct().getProductId() + " "
					+ c.getDescription() + " " + c.getScore());
		}

	}

	public void testFindByAll() {

		CommentDAO cd = new CommentDAO();
		List list = cd.findAll();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Comment c = (Comment) it.next();
			System.out.println(c.getUser().getName() + " "
					+ c.getProduct().getName() + " " + c.getDescription() + " "
					+ c.getScore());
		}

	}

}
