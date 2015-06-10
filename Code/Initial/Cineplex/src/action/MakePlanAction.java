package action;

import java.io.PrintWriter;
import java.util.List;

import model.MoviePlan;
import service.WaiterService;

public class MakePlanAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name;
	private String star;
	private String director;
	private String hall;
	private String seat;
	private String periodBegin;
	private String periodEnd;
	private String price;
	private String language;
	private String writer;
	private String actorplot;
	private String introduction;
	private String icon1;
	private String icon2;
	private String icon3;

	private WaiterService waiterService;

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

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getHall() {
		return hall;
	}

	public void setHall(String hall) {
		this.hall = hall;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getPeriodBegin() {
		return periodBegin;
	}

	public void setPeriodBegin(String periodBegin) {
		this.periodBegin = periodBegin;
	}

	public String getPeriodEnd() {
		return periodEnd;
	}

	public void setPeriodEnd(String periodEnd) {
		this.periodEnd = periodEnd;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
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

	public String getActorplot() {
		return actorplot;
	}

	public void setActorplot(String actorplot) {
		this.actorplot = actorplot;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getIcon1() {
		return icon1;
	}

	public void setIcon1(String icon1) {
		this.icon1 = icon1;
	}

	public String getIcon2() {
		return icon2;
	}

	public void setIcon2(String icon2) {
		this.icon2 = icon2;
	}

	public String getIcon3() {
		return icon3;
	}

	public void setIcon3(String icon3) {
		this.icon3 = icon3;
	}

	public WaiterService getWaiterService() {
		return waiterService;
	}

	public void setWaiterService(WaiterService waiterService) {
		this.waiterService = waiterService;
	}

	@Override
	public String execute() throws Exception {
		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		int mpid = waiterService.getMoviePlanIdByName(name);

		if (judgeTime(periodBegin, periodEnd)) {

			if (mpid == -1) {

				List<MoviePlan> moviePlans = waiterService.getAllMoviePlans();
				int id = moviePlans.size();

				if (icon1 == null) {
					icon1 = "movie_default1.png";
				}

				if (icon2 == null) {
					icon2 = "movie_default2.png";
				}

				if (icon3 == null) {
					icon3 = "movie_default3.png";
				}

				String period = periodBegin + "-" + periodEnd;

				MoviePlan moviePlan = new MoviePlan(id, name, star,
						"../db/images/" + icon1 + "&&../db/images/" + icon2,
						actorplot, "../db/images/" + icon3, director,
						introduction, Integer.parseInt(hall),
						Integer.parseInt(seat), period,
						Integer.parseInt(price), language, writer);

				int result = waiterService.addMoviePlan(moviePlan);

				if (result >= 0) {
					out.print("<script>alert('Add Plan Successfully!')</script>");
				}
			} else {
				out.print("<script>alert('Name Exists!')</script>");
			}
		} else {
			out.print("<script>alert('Period Error!')</script>");
		}

		out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/mplan.jsp?modify=1'</script>");
		out.flush();
		out.close();

		return SUCCESS;
	}

	public static boolean judgeTime(String date_str1, String date_str2) {
		// 转换为标准时间
		int hour1 = Integer.parseInt(date_str1.substring(11, 13));
		int hour2 = Integer.parseInt(date_str2.substring(0, 2));
		if (hour1 > hour2)
			return false;
		int minute1 = Integer.parseInt(date_str1.substring(14, 16));
		int minute2 = Integer.parseInt(date_str2.substring(3, 5));
		if (hour1 == hour2 && minute1 > minute2)
			return false;
		return true;
	}

}
