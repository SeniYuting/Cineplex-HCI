package vo;

public class ActivityVO {
	private String movie_name;
	private String introduction;
	private String pic;
	private String question;
	private String option;
	private int credit;
	private int question_id;
	private String submit;

	public ActivityVO() {
	}

	public ActivityVO(String movie_name, String introduction, String pic,
			String question, String option, int credit, int question_id,
			String submit) {
		this.movie_name = movie_name;
		this.introduction = introduction;
		this.pic = pic;
		this.question = question;
		this.option = option;
		this.credit = credit;
		this.question_id = question_id;
		this.submit = submit;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getQuestionId() {
		return question_id;
	}

	public void setQuestionId(int question_id) {
		this.question_id = question_id;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmitted(String submit) {
		this.submit = submit;
	}
}
