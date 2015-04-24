package action;

import java.io.PrintWriter;

import model.MoviePlan;
import service.WaiterService;

public class MakePlanSearchAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String moviePlanName;
	private WaiterService waiterService;

	public String getMoviePlanName() {
		return moviePlanName;
	}

	public void setMoviePlanName(String moviePlanName) {
		this.moviePlanName = moviePlanName;
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

		int moviePlan_id = waiterService.getMoviePlanIdByName(moviePlanName);

		if (moviePlan_id != -1) {
			MoviePlan moviePlan = waiterService.getMoviePlanById(moviePlan_id);
			request().setAttribute("moviePlan", moviePlan);

		} else {
			out.print("<script>alert('Name Error!')</script>");
			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/mplan.jsp?modify=1'</script>");
			out.flush();
			out.close();
		}

		return SUCCESS;
	}

}
