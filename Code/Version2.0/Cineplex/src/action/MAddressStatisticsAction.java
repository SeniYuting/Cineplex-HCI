package action;

import service.ManagerService;

public class MAddressStatisticsAction extends BaseAction {
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
		Integer[][] addressList = managerService.getAddressList();
		Integer[] maleList = addressList[0];
		Integer[] femaleList = addressList[1];
		
		request().setAttribute("maleList", maleList);
		request().setAttribute("femaleList", femaleList);
		
		return SUCCESS;
	}
}
