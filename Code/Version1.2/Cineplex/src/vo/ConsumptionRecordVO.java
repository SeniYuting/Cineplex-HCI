package vo;

public class ConsumptionRecordVO {

	private String movie_name;
	private String period;
	private int hall;
	private int member_seat;
	private int price;

	public ConsumptionRecordVO() {
	}

	public ConsumptionRecordVO(String movie_name, String period, int hall,
			int member_seat, int price) {
		this.movie_name = movie_name;
		this.period = period;
		this.hall = hall;
		this.member_seat = member_seat;
		this.price = price;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getHall() {
		return hall;
	}

	public void setHall(int hall) {
		this.hall = hall;
	}

	public int getmember_seat() {
		return member_seat;
	}

	public void setmember_seat(int member_seat) {
		this.member_seat = member_seat;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
