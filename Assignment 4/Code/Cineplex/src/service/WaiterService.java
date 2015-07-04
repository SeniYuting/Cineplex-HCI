package service;

import java.util.List;

import model.BankCard;
import model.Consumption;
import model.Member;
import model.Movie;
import model.MoviePlan;
import model.Payment;
import model.Question;
import model.Waiter;

public interface WaiterService {

	boolean checkLogin(Waiter waiter);

	public List<MoviePlan> getAllMoviePlans();

	public int getMoviePlanIdByName(String moviePlan_name);

	public MoviePlan getMoviePlanById(int moviePlan_id);

	public void deleteMoviePlanById(int moviePlan_id);

	public Integer addMoviePlan(MoviePlan moviePlan);

	public void updateMoviePlan(MoviePlan moviePlan);

	public List<Movie> getAllMovies();

	public Movie getMovieById(int movie_id);

	public int getMovieIdByName(String movie_name);
	
	public int getMovieIdByNameAndPeriod(String movie_name, String period);

	public Integer addMovie(Movie movie);

	public List<Question> getAllQuestions();

	public Question getQuestionById(int question_id);

	public List<Question> getQuestionsByMovieId(int movie_id);

	public Integer addQuestion(Question question);

	public Member getMemberById(int member_id);

	public List<Consumption> getAllConsumptions();

	public List<Consumption> getConsumptionById(int consumption_id);

	public List<Consumption> getConsumptionByMemberId(int member_id);

	public List<Consumption> getConsumptionByMovieId(int movie_id);

	public List<Consumption> getConsumptionByMemberIdAndMovieId(int member_id,
			int movie_id);

	public Integer addConsumption(Consumption consumption);
	
	public void updateMember(Member member);
	
	public BankCard getBankCardById(int bankCard_id);

	public List<Payment> getPaymentByMemberId(int member_id);

}
