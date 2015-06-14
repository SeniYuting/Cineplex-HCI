package model;

import java.io.Serializable;

public class Member implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String account;
	private String name;
	private String password;
	private int credit;
	private String address;
	private String gender;
	private String birthday;
	private String icon;
	private int membercard_number;
	private boolean state;
	private int balance;
	private int level;
	private String register_time;
	private String member_state;

	public Member() {
	}

	public Member(String account, String password) {
		this.account = account;
		this.password = password;
	}

	public Member(int id, String account, String name, String password,
			int credit, String address, String gender, String birthday,
			String icon, int membercard_number, boolean state, int balance,
			int level, String register_time, String member_state) {
		this.id = id;
		this.account = account;
		this.name = name;
		this.password = password;
		this.credit = credit;
		this.address = address;
		this.gender = gender;
		this.birthday = birthday;
		this.icon = icon;
		this.membercard_number = membercard_number;
		this.state = state;
		this.balance = balance;
		this.level = level;
		this.register_time = register_time;
		this.member_state = member_state;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getMembercard_number() {
		return membercard_number;
	}

	public void setMembercard_number(int membercard_number) {
		this.membercard_number = membercard_number;
	}

	public boolean getState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getRegister_time() {
		return register_time;
	}

	public void setRegister_time(String register_time) {
		this.register_time = register_time;
	}

	public String getMember_state() {
		return member_state;
	}

	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}

}
