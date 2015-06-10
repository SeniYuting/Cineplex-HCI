package model;

import java.io.Serializable;

public class Movie implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private String star;
	private String starpic;
	private String actorplot;
	private String pic;
	private String director;
	private String introduction;
	private int hall;
	private int seat;
	private String period;
	private int price;
	private String language;
	private String writer;
	private int isOn;

	public Movie() {
	}

	public Movie(int id, String name, String star, String starpic,
			String actorplot, String pic, String director, String introduction,
			int hall, int seat, String period, int price, String language,
			String writer, int isOn) {
		this.id = id;
		this.name = name;
		this.star = star;
		this.starpic = starpic;
		this.actorplot = actorplot;
		this.pic = pic;
		this.director = director;
		this.introduction = introduction;
		this.hall = hall;
		this.seat = seat;
		this.period = period;
		this.price = price;
		this.language = language;
		this.writer = writer;
		this.isOn = isOn;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getStarpic() {
		return starpic;
	}

	public void setStarpic(String starpic) {
		this.starpic = starpic;
	}

	public String getActorplot() {
		return actorplot;
	}

	public void setActorplot(String actorplot) {
		this.actorplot = actorplot;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getHall() {
		return hall;
	}

	public void setHall(int hall) {
		this.hall = hall;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getIsOn() {
		return isOn;
	}

	public void setIsOn(int isOn) {
		this.isOn = isOn;
	}

}
