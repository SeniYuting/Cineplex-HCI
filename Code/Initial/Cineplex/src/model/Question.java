package model;

import java.io.Serializable;

public class Question implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private int movie_id;
	private String question;
	private String quesoption;
	private int credit;

	public Question() {
	}

	public Question(int id, int movie_id, String question, String quesoption,
			int credit) {
		this.id = id;
		this.movie_id = movie_id;
		this.question = question;
		this.quesoption = quesoption;
		this.credit = credit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getQuesoption() {
		return quesoption;
	}

	public void setQuesoption(String quesoption) {
		this.quesoption = quesoption;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

}
