package edu.iss.ects.entity;

public class Orderstatus implements Entity {

	private Integer orderstatusId;
	private String name;
	private String description;

	public Integer getOrderstatusId() {
		return orderstatusId;
	}

	public void setOrderstatusId(Integer orderstatusId) {
		this.orderstatusId = orderstatusId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}