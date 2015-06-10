package action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import service.ManagerService;

public class MCardStatisticsAction extends BaseAction {
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
		Map<String, Integer[]> cardStateList = managerService.getCardStateList();
		Iterator<Entry<String, Integer[]>> iter = cardStateList.entrySet().iterator();
		List<String> keys = new ArrayList<String>();
		List<Integer[]> nums = new ArrayList<Integer[]>();
		while(iter.hasNext()){
			Entry<String, Integer[]> entry = iter.next();
			String cardState = entry.getKey();
			Integer[] num = entry.getValue();
			keys.add(cardState);
			nums.add(num);		
		}

		request().setAttribute("cardState", keys);
		request().setAttribute("nums", nums);
		
		return SUCCESS;
	}
}