package action;

import java.io.PrintWriter;
import java.util.List;

import model.Movie;
import model.MoviePlan;
import service.ManagerService;

public class PassAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ManagerService managerService;

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public String execute() throws Exception {
		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		int moviePlan_id = Integer.parseInt(request().getParameter(
				"moviePlan_id"));	
		MoviePlan moviePlan = managerService.getMoviePlanById(moviePlan_id);
		managerService.deleteMoviePlanById(moviePlan_id);
		
		List<Movie> movies = managerService.getAllMovies();
		int id = movies.size();
		Movie movie = new Movie(id, moviePlan.getName(), moviePlan.getStar(),
				moviePlan.getStarpic(), moviePlan.getActorplot(),
				moviePlan.getPic(), moviePlan.getDirector(),
				moviePlan.getIntroduction(), moviePlan.getHall(),
				moviePlan.getSeat(), moviePlan.getPeriod(),
				moviePlan.getPrice(), moviePlan.getLanguage(),
				moviePlan.getWriter(), 1);

		int result = managerService.addMovie(movie);

		if (result >= 0) {
			out.print("<script>alert('Pass Successfully!')</script>");
			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/allPlansPro'</script>");
		}
		
		out.flush();
		out.close();

		return SUCCESS;
	}

}
