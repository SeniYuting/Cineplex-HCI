package model;

import java.io.Serializable;

public class Manager implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String account;
	private String password;

	public Manager() {
	}

	public Manager(String account, String password) {
		this.account = account;
		this.password = password;
	}

	public Manager(int id, String account, String password) {
		this.id = id;
		this.account = account;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
