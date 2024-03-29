package com.jc.dto;

public class UserLogin implements java.io.Serializable {

	private Integer id;
	private String loginName;
	private String pwd;
	private String type;
	private String mail;

	/** ���췽�� */
	public UserLogin() {
	}

	public UserLogin(String loginName, String pwd, String type, String mail) {
		this.loginName = loginName;
		this.pwd = pwd;
		this.type = type;
		this.mail = mail;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}