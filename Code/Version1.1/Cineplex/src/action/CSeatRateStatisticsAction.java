package action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;

import service.ManagerService;

public class CSeatRateStatisticsAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ManagerService managerService;

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String execute() throws Exception {

		LinkedHashMap<String, Integer> movie_people = managerService
				.getTopFourMovieList();

		List<String> movie_nameList = new ArrayList<String>();
		List<Integer> peopleList = new ArrayList<Integer>();

		// 先加4个，确保至少4个值
		for (int i = 0; i < 100; i++) {
			movie_nameList.add("");
			peopleList.add(0);
		}

		int k = 0;
		
		for(Iterator it = movie_people.entrySet().iterator();it.hasNext();){  
            Entry<String, Integer> entry = (Entry<String, Integer>)it.next();  
            if(!"".equals(entry.getValue())){  
                movie_nameList.set(k, entry.getKey());
    			peopleList.set(k, entry.getValue());
    			k++;
            }  
        }
		
		request().setAttribute("movie_nameList", movie_nameList);
		request().setAttribute("peopleList", peopleList);

		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);
		int month_current = c.get(Calendar.MONTH) + 1;
		request().setAttribute("time", year_current + "-" + month_current);

		return SUCCESS;
	}
}
