package service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import model.Answer;
import model.Manager;
import model.Member;
import model.Movie;
import model.MoviePlan;
import model.Question;

public interface ManagerService {

	boolean checkLogin(Manager manager);

	public Integer[] getAgeList();

	public Integer[][] getGenderList();

	public Integer[][] getAddressList();

	public Integer[] getCreditList();

	public Map<String, Integer[]> getCardStateList();

	public List<List<Integer>> getDayNumsList();

	public List<Integer> getMonthNumsList();

	public List<List<Integer>> getHallNumsList();

	public List<List<Float>> getCardCashNumsList();

	public LinkedHashMap<String, Integer> getTopFourMovieList();

	public List<MoviePlan> getAllMoviePlans();

	public int getMoviePlanIdByName(String moviePlan_name);

	public MoviePlan getMoviePlanById(int moviePlan_id);

	public void deleteMoviePlanById(int moviePlan_id);

	public Integer addMoviePlan(MoviePlan moviePlan);

	public void updateMoviePlan(MoviePlan moviePlan);

	public List<Movie> getAllMovies();

	public Movie getMovieById(int movie_id);

	public int getMovieIdByName(String movie_name);

	public Integer addMovie(Movie movie);
	
	public void updateMovie(Movie movie); 
	
	public List<Question> getQuestionsByMovieId(int movie_id);
	
	public List<Answer> getAnswersByQuestionId(int question_id);
	
	public Member getMemberById(int member_id);
	
	public void updateMember(Member member);

}
