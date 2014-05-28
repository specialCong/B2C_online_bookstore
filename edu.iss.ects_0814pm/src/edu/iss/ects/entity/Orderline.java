package edu.iss.ects.entity;

public class Orderline implements Entity {

	private Integer orderlineId;
	private Integer amount;
	private Orders order;
	private Product product;

	public Integer getOrderlineId() {
		return orderlineId;
	}

	public void setOrderlineId(Integer orderlineId) {
		this.orderlineId = orderlineId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Orderline(Integer amount, Orders order, Product product) {
		super();
		this.amount = amount;
		this.order = order;
		this.product = product;
	}

	public Orderline() {
		super();
	}

}