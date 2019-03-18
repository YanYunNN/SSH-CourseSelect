package com.jc.dto;

public class Specialty implements java.io.Serializable {

	private Integer id;
	private String enterYear;
	private String name;
	private String langthYear;
	private Boolean isFinish;

	/** 构造方法 */
	public Specialty() {
	}

	public Specialty(String enterYear, String name, String langthYear,
			Boolean isFinish) {
		this.enterYear = enterYear;
		this.name = name;
		this.langthYear = langthYear;
		this.isFinish = isFinish;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEnterYear() {
		return this.enterYear;
	}

	public void setEnterYear(String enterYear) {
		this.enterYear = enterYear;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLangthYear() {
		return this.langthYear;
	}

	public void setLangthYear(String langthYear) {
		this.langthYear = langthYear;
	}

	public Boolean getIsFinish() {
		return this.isFinish;
	}

	public void setIsFinish(Boolean isFinish) {
		this.isFinish = isFinish;
	}

}