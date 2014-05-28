package edu.iss.ects.entity;

public class Province implements java.io.Serializable {

	private Integer provinceId;
	private String name;
	private Country country;

	public Integer getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Province(Country country, String name) {
		super();
		this.country = country;
		this.name = name;
	}

	public Province() {
		super();
	}

}