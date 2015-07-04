package action;

import java.io.PrintWriter;

import model.MoviePlan;
import service.WaiterService;

public class ModifyPlanAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name;
	private String star;
	private String director;
	private String hall;
	private String seat;
	private String period;
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

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
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

		if (mpid != -1) {

			MoviePlan moviePlan = waiterService.getMoviePlanById(mpid);
			moviePlan.setName(name);
			moviePlan.setStar(star);

			if (icon1 != null && icon2 == null) {
				moviePlan.setStarpic("../db/images/" + icon1 + "&&"
						+ moviePlan.getStarpic().split("&&")[1]);
			} else if (icon2 != null && icon1 == null) {
				moviePlan.setStarpic(moviePlan.getStarpic().split("&&")[0]
						+ "&&../db/images/" + icon2);
			} else if (icon1 != null && icon2 != null) {
				moviePlan.setStarpic("../db/images/" + icon1 + "&&../db/images/"
						+ icon2);
			}

			if (icon3 != null) {
				moviePlan.setPic("../db/images/" + icon3);
			}

			moviePlan.setActorplot(actorplot);
			moviePlan.setDirector(director);
			moviePlan.setIntroduction(introduction);
			moviePlan.setHall(Integer.parseInt(hall));
			moviePlan.setSeat(Integer.parseInt(seat));
			moviePlan.setPeriod(period);
			moviePlan.setPrice(Integer.parseInt(price));
			moviePlan.setLanguage(language);
			moviePlan.setWriter(writer);

			waiterService.updateMoviePlan(moviePlan);

			out.print("<script>alert('Update Plan Successfully!')</script>");
			out.print("<script>window.location.href='mplan.jsp?modify=1'</script>");
			out.flush();
			out.close();

		}

		return SUCCESS;
	}
}
