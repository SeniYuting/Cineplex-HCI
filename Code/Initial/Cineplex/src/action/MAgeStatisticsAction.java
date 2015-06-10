package action;

import service.ManagerService;

public class MAgeStatisticsAction extends BaseAction {
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
		Integer[] ageList = managerService.getAgeList();
		request().setAttribute("ageList", ageList);
		
		return SUCCESS;
	}
}

