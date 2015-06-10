package action;

import service.ManagerService;

public class MActivityCreditStatisticsAction extends BaseAction {
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
		Integer[] creditList = managerService.getCreditList();
		request().setAttribute("creditList", creditList);
		
		return SUCCESS;
	}
}
