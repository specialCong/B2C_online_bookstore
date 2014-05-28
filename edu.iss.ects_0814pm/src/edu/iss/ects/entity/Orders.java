package edu.iss.ects.entity;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Orders implements Entity {

	private Integer orderId;
	private Double cost;
	private User user;
	private Payway payway;
	private Orderstatus orderstatus;
	private Set orderlines = new HashSet();

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Payway getPayway() {
		return payway;
	}

	public void setPayway(Payway payway) {
		this.payway = payway;
	}

	public Orderstatus getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(Orderstatus orderstatus) {
		this.orderstatus = orderstatus;
	}

	public Set getOrderlines() {
		return orderlines;
	}

	public void setOrderlines(Set orderlines) {
		this.orderlines = orderlines;
	}

	public int getCount() {
		int count = 0;
		Iterator it = orderlines.iterator();
		while (it.hasNext()) {
			Orderline line = (Orderline) it.next();
			count += line.getAmount();
		}
		return count;
	}

}