package action;

import service.ManagerService;

public class MGenderStatisticsAction extends BaseAction {
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
		Integer[][] genderList = managerService.getGenderList();
		Integer[] maleList = genderList[0];
		Integer[] femaleList = genderList[1];
		
		request().setAttribute("maleList", maleList);
		request().setAttribute("femaleList", femaleList);
		
		return SUCCESS;
	}
}
