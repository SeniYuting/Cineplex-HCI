package service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import model.Answer;
import model.Consumption;
import model.Manager;
import model.Member;
import model.Movie;
import model.MoviePlan;
import model.Question;
import dao.AnswerDao;
import dao.ConsumptionDao;
import dao.ManagerDao;
import dao.MemberDao;
import dao.MovieDao;
import dao.MoviePlanDao;
import dao.QuestionDao;
import service.ManagerService;

public class ManagerServiceImpl implements ManagerService {

	private ConsumptionDao consumptionDao;
	private ManagerDao managerDao;
	private MemberDao memberDao;
	private MovieDao movieDao;
	private MoviePlanDao moviePlanDao;
	private QuestionDao questionDao;
	private AnswerDao answerDao;

	public void setConsumptionDao(ConsumptionDao consumptionDao) {
		this.consumptionDao = consumptionDao;
	}

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void setMovieDao(MovieDao movieDao) {
		this.movieDao = movieDao;
	}

	public void setMoviePlanDao(MoviePlanDao moviePlanDao) {
		this.moviePlanDao = moviePlanDao;
	}

	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public void setAnswerDao(AnswerDao answerDao) {
		this.answerDao = answerDao;
	}

	@Override
	public boolean checkLogin(Manager manager) {
		return managerDao.findByAccountAndPassword(manager);
	}

	@Override
	public Integer[] getAgeList() {
		Integer[] ageList = { 0, 0, 0, 0, 0, 0, 0 };
		List<Member> members = memberDao.getAllMembers();
		for (int i = 0; i < members.size(); i++) {
			String birthday = members.get(i).getBirthday();
			long days = getDays(birthday);
			int age = (int) (days / 365) + 1;

			if (age < 60) {
				int index = age / 10;
				ageList[index] += 1;
			} else {
				ageList[6] += 1;
			}

		}
		return ageList;
	}

	// 与当前日期相隔的天数
	public static long getDays(String date_str) {
		// 转换为标准时间
		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		Date mydate = null;
		try {
			String date_now_str = myFormatter.format(new Date());
			date = myFormatter.parse(date_now_str);
			mydate = myFormatter.parse(date_str);
		} catch (Exception e) {
		}
		long day = (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000);
		return day;
	}

	@Override
	public Integer[][] getGenderList() {
		Integer[][] genderList = {
				{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
				{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
		List<Member> members = memberDao.getAllMembers();
		for (int i = 0; i < members.size(); i++) {

			String birthday = members.get(i).getBirthday();
			int year = Integer.parseInt(birthday.substring(0, 4));
			int index = year - 1950;
			if (index < 0)
				index = 0;
			if (index > 66)
				index = 66;

			String gender = members.get(i).getGender();

			if (gender.equals("male")) {
				genderList[0][index]++;
			} else {
				genderList[1][index]++;
			}

		}
		return genderList;
	}

	@Override
	public Integer[][] getAddressList() {
		Integer[][] addressList = { { 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0 } };
		List<Member> members = memberDao.getAllMembers();
		for (int i = 0; i < members.size(); i++) {
			String address = members.get(i).getAddress();

			int index = 0;
			switch (address) {
			case "Jiangsu":
				index = 0;
				break;
			case "Beijing":
				index = 1;
				break;
			case "Shanghai":
				index = 2;
				break;
			case "Chongqing":
				index = 3;
				break;
			case "Tianjin":
				index = 4;
				break;
			default:
				index = 5;
				break;
			}

			String gender = members.get(i).getGender();
			if (gender.equals("male")) {
				addressList[0][index]++;
			} else {
				addressList[1][index]++;
			}

		}
		return addressList;
	}

	@Override
	public Integer[] getCreditList() {
		Integer[] creditList = { 0, 0, 0, 0, 0, 0, 0 };
		List<Member> members = memberDao.getAllMembers();
		for (int i = 0; i < members.size(); i++) {
			int credit = members.get(i).getCredit();

			if (credit < 120) {
				int index = credit / 20;
				creditList[index] += 1;
			} else {
				creditList[6] += 1;
			}

		}
		return creditList;
	}

	@Override
	public Map<String, Integer[]> getCardStateList() {
		List<Member> members = memberDao.getAllMembers();
		Map<String, Integer[]> cardStateList = new HashMap<String, Integer[]>();

		for (int i = 0; i < members.size(); i++) {
			Member member = members.get(i);
			String member_state = member.getMember_state();
			int register_year = Integer.parseInt(member.getRegister_time()
					.substring(0, 4));

			int index = 0;
			switch ((register_year - 2000) / 5) {
			case 0:
				index = 1;
				break;
			case 1:
				index = 2;
				break;
			case 2:
				index = 3;
				break;
			default:
				index = 4;
				break;
			}

			if (register_year < 2000)
				index = 0;

			if (cardStateList.containsKey(member_state)) {
				Integer[] iList = cardStateList.get(member_state);
				iList[index] += 1;
				cardStateList.put(member_state, iList);
			} else {
				Integer[] iList = { 0, 0, 0, 0, 0 };
				iList[index] = 1;
				cardStateList.put(member_state, iList);
			}
		}

		return cardStateList;
	}

	@Override
	public List<List<Integer>> getDayNumsList() {
		List<List<Integer>> dayNumsList = new ArrayList<List<Integer>>();

		Integer[] daysThisMonthList = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		Integer[] daysLastMonthList = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);
		int month_current = c.get(Calendar.MONTH) + 1;

		int year_last = year_current;
		int month_last = month_current - 1;

		if (month_current == 1) {
			year_last = year_current - 1;
			month_last = 12;
		}

		List<Consumption> consumptions = consumptionDao.getAllConsumptions();

		for (int i = 0; i < consumptions.size(); i++) {
			Consumption consumption = consumptions.get(i);
			String movie_time = consumption.getMovie_time();
			int year = Integer.parseInt(movie_time.substring(0, 4));
			int month = Integer.parseInt(movie_time.substring(5, 7));
			int day = Integer.parseInt(movie_time.substring(8, 10));

			if (year == year_current && month == month_current) {
				daysThisMonthList[day - 1]++;
			}

			if (year == year_last && month == month_last) {
				daysLastMonthList[day - 1]++;
			}
		}

		List<Integer> thisL = new ArrayList<Integer>();
		List<Integer> lastL = new ArrayList<Integer>();
		for (int i = 0; i < 31; i++) {
			thisL.add(daysThisMonthList[i]);
			lastL.add(daysLastMonthList[i]);
		}

		dayNumsList.add(thisL);
		dayNumsList.add(lastL);

		return dayNumsList;
	}

	@Override
	public List<Integer> getMonthNumsList() {
		List<Integer> monthNumsList = new ArrayList<Integer>();
		Integer[] monthList = new Integer[12];
		for (int i = 0; i < 12; i++)
			monthList[i] = 0;

		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);

		List<Consumption> consumptions = consumptionDao.getAllConsumptions();
		for (int i = 0; i < consumptions.size(); i++) {
			Consumption consumption = consumptions.get(i);
			String movie_time = consumption.getMovie_time();
			int year = Integer.parseInt(movie_time.substring(0, 4));
			int month = Integer.parseInt(movie_time.substring(5, 7));

			if (year == year_current - 1) {
				monthList[month - 1] += 1;
			}
		}

		for (int i = 0; i < 12; i++) {
			monthNumsList.add(monthList[i]);
		}

		return monthNumsList;
	}

	@Override
	public List<List<Integer>> getHallNumsList() {
		List<List<Integer>> hallNumsList = new ArrayList<List<Integer>>();

		Integer[] oneHallList = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		Integer[] twoHallList = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		Integer[] threeHallList = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);

		List<Consumption> consumptions = consumptionDao.getAllConsumptions();
		for (int i = 0; i < consumptions.size(); i++) {
			Consumption consumption = consumptions.get(i);
			String movie_time = consumption.getMovie_time();
			int year = Integer.parseInt(movie_time.substring(0, 4));
			int month = Integer.parseInt(movie_time.substring(5, 7));

			if (year == year_current - 1) {
				int hall = consumption.getMovie_hall();
				switch (hall) {
				case 1:
					oneHallList[month - 1] += 1;
					break;
				case 2:
					twoHallList[month - 1] += 1;
					break;
				case 3:
					threeHallList[month - 1] += 1;
					break;
				}
			}
		}

		List<Integer> oneL = new ArrayList<Integer>();
		List<Integer> twoL = new ArrayList<Integer>();
		List<Integer> threeL = new ArrayList<Integer>();
		for (int i = 0; i < 12; i++) {
			oneL.add(oneHallList[i]);
			twoL.add(twoHallList[i]);
			threeL.add(threeHallList[i]);
		}

		hallNumsList.add(oneL);
		hallNumsList.add(twoL);
		hallNumsList.add(threeL);

		return hallNumsList;
	}

	@Override
	public List<List<Float>> getCardCashNumsList() {
		List<List<Float>> cardCashNumsList = new ArrayList<List<Float>>();

		Float[] cardList = { (float) 0, (float) 0, (float) 0, (float) 0,
				(float) 0, (float) 0, (float) 0, (float) 0, (float) 0,
				(float) 0, (float) 0, (float) 0 };
		Float[] cashList = { (float) 0, (float) 0, (float) 0, (float) 0,
				(float) 0, (float) 0, (float) 0, (float) 0, (float) 0,
				(float) 0, (float) 0, (float) 0 };

		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);

		List<Consumption> consumptions = consumptionDao.getAllConsumptions();
		for (int i = 0; i < consumptions.size(); i++) {
			Consumption consumption = consumptions.get(i);
			String movie_time = consumption.getMovie_time();
			int year = Integer.parseInt(movie_time.substring(0, 4));
			int month = Integer.parseInt(movie_time.substring(5, 7));
			if (year == year_current - 1) {
				String way = consumption.getWay();
				if (way.equals("Card")) {
					cardList[month - 1] += 1;
				} else {
					cashList[month - 1] += 1;
				}
			}
		}

		List<Float> cardL = new ArrayList<Float>();
		List<Float> cashL = new ArrayList<Float>();
		List<Float> averageL = new ArrayList<Float>();
		for (int i = 0; i < 12; i++) {
			cardL.add(cardList[i]);
			cashL.add(cashList[i]);
			averageL.add((cardList[i] + cashList[i]) / 2);
		}

		cardCashNumsList.add(cardL);
		cardCashNumsList.add(cashL);
		cardCashNumsList.add(averageL);

		return cardCashNumsList;
	}

	@Override
	public LinkedHashMap<String, Integer> getTopFourMovieList() {
		LinkedHashMap<String, Integer> movie_people = new LinkedHashMap<String, Integer>();

		Calendar c = Calendar.getInstance();
		int year_current = c.get(Calendar.YEAR);
		int month_current = c.get(Calendar.MONTH) + 1;

		List<Consumption> consumptions = consumptionDao.getAllConsumptions();
		for (int i = 0; i < consumptions.size(); i++) {
			Consumption consumption = consumptions.get(i);
			String movie_time = consumption.getMovie_time();
			int year = Integer.parseInt(movie_time.substring(0, 4));
			int month = Integer.parseInt(movie_time.substring(5, 7));
			if (year == year_current && month == month_current) {
				String movie_name = consumption.getMovie_name();
				if (movie_people.containsKey(movie_name)) {
					int j = movie_people.get(movie_name);
					j++;
					movie_people.put(movie_name, j);
				} else {
					movie_people.put(movie_name, 1);
				}
			}
		}

		List<Map.Entry<String, Integer>> infoIds = new ArrayList<Map.Entry<String, Integer>>(
				movie_people.entrySet());
		Collections.sort(infoIds, new Comparator<Map.Entry<String, Integer>>() {
			public int compare(Map.Entry<String, Integer> o1,
					Map.Entry<String, Integer> o2) {
				return (o2.getValue() - o1.getValue());
			}
		});

		LinkedHashMap<String, Integer> new_movie_people = new LinkedHashMap<String, Integer>();
		for (int i = 0; i < infoIds.size(); i++) {
			new_movie_people.put(infoIds.get(i).getKey(), infoIds.get(i)
					.getValue());
			System.out.println(infoIds.get(i).getKey());
		}

		return new_movie_people;
	}

	@Override
	public List<MoviePlan> getAllMoviePlans() {
		return moviePlanDao.getAllMoviePlans();
	}

	@Override
	public int getMoviePlanIdByName(String moviePlan_name) {
		return moviePlanDao.getMoviePlanIdByName(moviePlan_name);
	}

	@Override
	public MoviePlan getMoviePlanById(int moviePlan_id) {
		return moviePlanDao.getMoviePlanById(moviePlan_id);
	}

	@Override
	public void deleteMoviePlanById(int moviePlan_id) {
		MoviePlan moviePlan = moviePlanDao.getMoviePlanById(moviePlan_id);
		if (moviePlan != null) {
			moviePlanDao.delete(moviePlan);
		}
	}

	@Override
	public Integer addMoviePlan(MoviePlan moviePlan) {
		return moviePlanDao.save(moviePlan);
	}

	@Override
	public void updateMoviePlan(MoviePlan moviePlan) {
		moviePlanDao.update(moviePlan);
	}

	@Override
	public List<Movie> getAllMovies() {
		return movieDao.getAllMovies();
	}

	@Override
	public int getMovieIdByName(String movie_name) {
		return movieDao.getMovieIdByName(movie_name);
	}

	@Override
	public Movie getMovieById(int movie_id) {
		return movieDao.getMovieById(movie_id);
	}

	@Override
	public Integer addMovie(Movie movie) {
		return movieDao.save(movie);
	}

	@Override
	public void updateMovie(Movie movie) {
		movieDao.update(movie);
	}

	@Override
	public List<Question> getQuestionsByMovieId(int movie_id) {
		return questionDao.getQuestionsByMovieId(movie_id);
	}

	@Override
	public List<Answer> getAnswersByQuestionId(int question_id) {
		return answerDao.getAnswersByQuestionId(question_id);
	}
	
	@Override
	public Member getMemberById(int member_id) {
		return memberDao.getMemberById(member_id);
	}
	
	@Override
	public void updateMember(Member member) {
		memberDao.update(member);
	}

}
