package model;

import java.io.Serializable;

public class Consumption implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private int member_id;
	private int movie_id;
	private int seat;
	private String way;
	private String movie_name;
	private String movie_time;
	private int movie_hall;

	public Consumption() {
	}

	public Consumption(int id, int member_id, int movie_id, int seat,
			String way, String movie_name, String movie_time, int movie_hall) {
		this.id = id;
		this.member_id = member_id;
		this.movie_id = movie_id;
		this.seat = seat;
		this.way = way;
		this.movie_name = movie_name;
		this.movie_time = movie_time;
		this.movie_hall = movie_hall;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getMovie_time() {
		return movie_time;
	}

	public void setMovie_time(String movie_time) {
		this.movie_time = movie_time;
	}

	public int getMovie_hall() {
		return movie_hall;
	}

	public void setMovie_hall(int movie_hall) {
		this.movie_hall = movie_hall;
	}

}
