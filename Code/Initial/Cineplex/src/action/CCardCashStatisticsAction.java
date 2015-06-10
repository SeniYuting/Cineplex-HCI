package action;

import java.util.Calendar;
import java.util.List;

import service.ManagerService;

public class CCardCashStatisticsAction extends BaseAction {
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
		List<List<Float>> cardCashNumsList = managerService
				.getCardCashNumsList();
		List<Float> cardNumsList = cardCashNumsList.get(0);
		List<Float> cashNumsList = cardCashNumsList.get(1);
		List<Float> averageList = cardCashNumsList.get(2);

		request().setAttribute("cardNumsList", cardNumsList);
		request().setAttribute("cashNumsList", cashNumsList);
		request().setAttribute("averageList", averageList);
		
		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);
		request().setAttribute("lastYear", year_current - 1);

		return SUCCESS;
	}
}