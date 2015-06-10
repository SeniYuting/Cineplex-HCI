package action;

import model.MoviePlan;
import service.ManagerService;

public class OnePlanAction extends BaseAction {
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
		
		String moviePlan_name = request().getParameter("moviePlan_name");
		
		int moviePlan_id = managerService.getMoviePlanIdByName(moviePlan_name);
		
		MoviePlan moviePlan = managerService.getMoviePlanById(moviePlan_id);
		request().setAttribute("moviePlan", moviePlan);

		return SUCCESS;
	}

}
