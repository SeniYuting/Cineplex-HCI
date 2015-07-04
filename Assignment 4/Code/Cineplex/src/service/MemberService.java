package service;

import java.util.List;

import model.Answer;
import model.BankCard;
import model.Consumption;
import model.Manager;
import model.Member;
import model.Movie;
import model.Payment;
import model.Question;
import model.Waiter;

public interface MemberService {

	public boolean registerMember(Member member);

	boolean checkLogin(Member member);

	public List<Answer> getAllAnswers();

	public Answer getAnswerById(int answer_id);

	public List<Answer> getAnswerByQusIdandMemId(int question_id, int member_id);
	
	public Integer addAnswer(Answer answer);
	
	public void updateAnswer(Answer answer);

	public List<BankCard> getAllBankCards();

	public BankCard getBankCardById(int bankCard_id);
	
	public List<BankCard> getBankCardByNumber(int number);
	
	public void updateBankCard(BankCard bankCard);

	public List<Consumption> getAllConsumptions();

	public List<Consumption> getConsumptionById(int consumption_id);

	public List<Consumption> getConsumptionByMemberId(int member_id);

	public List<Consumption> getConsumptionByMovieId(int movie_id);

	public List<Consumption> getConsumptionByMemberIdAndMovieId(int member_id,
			int movie_id);

	public Integer addConsumption(Consumption consumption);

	public List<Manager> getAllManagers();

	public Manager getManagerById(int manager_id);

	public List<Member> getAllMembers();

	public Member getMemberById(int member_id);

	public Integer getIdByAccount(String account);

	public void updateMember(Member member);

	public List<Movie> getAllMovies();

	public Movie getMovieById(int movie_id);

	public int getMovieIdByName(String movie_name);

	public List<Payment> getAllPayments();

	public Payment getPaymentById(int payment_id);

	public List<Payment> getPaymentByMemberId(int member_id);
	
	public Integer addPayment(Payment payment);

	public List<Question> getAllQuestions();

	public Question getQuestionById(int question_id);

	public List<Question> getQuestionsByMovieId(int movie_id);

	public List<Waiter> getAllWaiters();

	public Waiter getWaitertById(int waiter_id);
	
	void autoMember();

}
