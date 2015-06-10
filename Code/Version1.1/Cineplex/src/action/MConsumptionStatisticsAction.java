package action;

import java.util.Calendar;
import java.util.List;

import service.ManagerService;

public class MConsumptionStatisticsAction extends BaseAction {
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
		List<Integer> monthNumsList = managerService.getMonthNumsList();
		request().setAttribute("monthNumsList", monthNumsList);

		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);
		request().setAttribute("lastYear", year_current - 1);

		return SUCCESS;
	}
}
