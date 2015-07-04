package model;

import java.io.Serializable;

public class Payment implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private int member_id;
	private int bankcard_id;
	private String time;
	private int fee;

	public Payment() {
	}

	public Payment(int id, int member_id, int bankcard_id,
			String time, int fee) {
		this.id = id;
		this.member_id = member_id;
		this.bankcard_id = bankcard_id;
		this.time = time;
		this.fee = fee;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getmember_id() {
		return member_id;
	}

	public void setmember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getBankcard_id() {
		return bankcard_id;
	}

	public void setBankcard_id(int bankcard_id) {
		this.bankcard_id = bankcard_id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

}
