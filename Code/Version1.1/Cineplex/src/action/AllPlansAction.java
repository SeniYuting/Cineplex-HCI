package action;

import java.util.List;

import model.MoviePlan;
import service.ManagerService;

public class AllPlansAction extends BaseAction {
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
		
		List<MoviePlan> moviePlans = managerService.getAllMoviePlans();
		
		if (moviePlans.size() == 0)
			request().setAttribute("noMoviePlan", "true");
		
		request().setAttribute("moviePlans", moviePlans);

		return SUCCESS;
	}

}