package action;

import java.util.Calendar;
import java.util.List;

import service.ManagerService;

public class CHallStatisticsAction extends BaseAction {
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
		List<List<Integer>> hallNumsList = managerService.getHallNumsList();
		List<Integer> hall_one_NumsList = hallNumsList.get(0);
		List<Integer> hall_two_NumsList = hallNumsList.get(1);
		List<Integer> hall_three_NumsList = hallNumsList.get(2);

		request().setAttribute("hall_one_NumsList", hall_one_NumsList);
		request().setAttribute("hall_two_NumsList", hall_two_NumsList);
		request().setAttribute("hall_three_NumsList", hall_three_NumsList);
		
		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);
		request().setAttribute("lastYear", year_current - 1);

		return SUCCESS;
	}
}
