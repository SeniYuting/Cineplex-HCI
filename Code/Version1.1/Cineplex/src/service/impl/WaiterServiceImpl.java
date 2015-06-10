package service.impl;

import java.util.List;

import model.BankCard;
import model.Consumption;
import model.Member;
import model.Movie;
import model.MoviePlan;
import model.Payment;
import model.Question;
import model.Waiter;
import dao.BankCardDao;
import dao.ConsumptionDao;
import dao.MemberDao;
import dao.MovieDao;
import dao.MoviePlanDao;
import dao.PaymentDao;
import dao.QuestionDao;
import dao.WaiterDao;
import service.WaiterService;

public class WaiterServiceImpl implements WaiterService {

	private BankCardDao bankCardDao;
	private ConsumptionDao consumptionDao;
	private MemberDao memberDao;
	private MovieDao movieDao;
	private MoviePlanDao moviePlanDao;
	private PaymentDao paymentDao;
	private QuestionDao questionDao;
	private WaiterDao waiterDao;

	public void setBankCardDao(BankCardDao bankCardDao) {
		this.bankCardDao = bankCardDao;
	}

	public void setConsumptionDao(
			ConsumptionDao consumptionDao) {
		this.consumptionDao = consumptionDao;
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

	public void setPaymentDao(PaymentDao paymentDao) {
		this.paymentDao = paymentDao;
	}

	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public void setWaiterDao(WaiterDao waiterDao) {
		this.waiterDao = waiterDao;
	}

	@Override
	public boolean checkLogin(Waiter waiter) {
		return waiterDao.findByAccountAndPassword(waiter);
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
	public int getMovieIdByNameAndPeriod(String movie_name, String period) {
		return movieDao.getMovieIdByNameAndPeriod(movie_name, period);
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
	public List<Question> getAllQuestions() {
		return questionDao.getAllQuestions();
	}

	@Override
	public Question getQuestionById(int question_id) {
		return questionDao.getQuestionById(question_id);
	}

	@Override
	public List<Question> getQuestionsByMovieId(int movie_id) {
		return questionDao.getQuestionsByMovieId(movie_id);
	}

	@Override
	public Integer addQuestion(Question question) {
		return questionDao.save(question);
	}
	
	@Override
	public Member getMemberById(int member_id) {
		return memberDao.getMemberById(member_id);
	}

	@Override
	public List<Consumption> getAllConsumptions() {
		return consumptionDao.getAllConsumptions();
	}

	@Override
	public List<Consumption> getConsumptionById(int consumption_id) {
		return consumptionDao.getConsumptionById(consumption_id);
	}

	@Override
	public List<Consumption> getConsumptionByMemberId(int member_id) {
		return consumptionDao.getConsumptionByMemberId(member_id);
	}

	@Override
	public List<Consumption> getConsumptionByMovieId(int movie_id) {
		return consumptionDao.getConsumptionByMovieId(movie_id);
	}

	@Override
	public List<Consumption> getConsumptionByMemberIdAndMovieId(int member_id,
			int movie_id) {
		return consumptionDao.getConsumptionByMemberIdAndMovieId(member_id,
				movie_id);
	}

	@Override
	public Integer addConsumption(Consumption consumption) {
		return consumptionDao.save(consumption);
	}
	
	@Override
	public void updateMember(Member member) {
		memberDao.update(member);
	}
	
	@Override
	public BankCard getBankCardById(int bankCard_id) {
		return bankCardDao.getBankCardById(bankCard_id);
	}
	
	@Override
	public List<Payment> getPaymentByMemberId(int member_id) {
		return paymentDao.getPaymentByMemberId(member_id);
	}
	
}
