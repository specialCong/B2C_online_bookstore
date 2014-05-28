package edu.iss.ects.entity;

public class Country implements java.io.Serializable {

	private Integer countryId;
	private String name;

	public Integer getCountryId() {
		return this.countryId;
	}

	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}