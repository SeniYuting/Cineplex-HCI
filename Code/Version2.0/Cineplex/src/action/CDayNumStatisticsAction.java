package action;

import java.util.List;

import service.ManagerService;

public class CDayNumStatisticsAction extends BaseAction {
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
		List<List<Integer>> dayNumsList = managerService.getDayNumsList();
		List<Integer> thisMonthNumsList = dayNumsList.get(0);
		List<Integer> lastMonthNumsList = dayNumsList.get(1);
		
		request().setAttribute("thisMonthNumsList", thisMonthNumsList);
		request().setAttribute("lastMonthNumsList", lastMonthNumsList);
		
		return SUCCESS;
	}
}


