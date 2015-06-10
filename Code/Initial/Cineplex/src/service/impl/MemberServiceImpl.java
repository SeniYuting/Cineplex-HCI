package service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import dao.AnswerDao;
import dao.BankCardDao;
import dao.ConsumptionDao;
import dao.ManagerDao;
import dao.MemberDao;
import dao.MovieDao;
import dao.PaymentDao;
import dao.QuestionDao;
import dao.WaiterDao;
import service.MemberService;

public class MemberServiceImpl implements MemberService {

	private AnswerDao answerDao;
	private BankCardDao bankCardDao;
	private ConsumptionDao consumptionDao;
	private ManagerDao managerDao;
	private MemberDao memberDao;
	private MovieDao movieDao;
	private PaymentDao paymentDao;
	private QuestionDao questionDao;
	private WaiterDao waiterDao;

	public void setAnswerDao(AnswerDao answerDao) {
		this.answerDao = answerDao;
	}

	public void setBankCardDao(BankCardDao bankCardDao) {
		this.bankCardDao = bankCardDao;
	}

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
	public boolean registerMember(Member member) {
		int result = memberDao.save(member);
		if (result >= 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkLogin(Member member) {
		return memberDao.findByAccountAndPassword(member);
	}

	@Override
	public List<Answer> getAllAnswers() {
		return answerDao.getAllAnswers();
	}

	@Override
	public Answer getAnswerById(int answer_id) {
		return answerDao.getAnswerById(answer_id);
	}

	@Override
	public List<Answer> getAnswerByQusIdandMemId(int question_id, int member_id) {
		return answerDao.getAnswerByQusIdandMemId(question_id, member_id);
	}

	@Override
	public Integer addAnswer(Answer answer) {
		return answerDao.save(answer);
	}

	@Override
	public void updateAnswer(Answer answer) {
		answerDao.update(answer);
	}

	@Override
	public List<BankCard> getAllBankCards() {
		return bankCardDao.getAllBankCards();
	}

	@Override
	public BankCard getBankCardById(int bankCard_id) {
		return bankCardDao.getBankCardById(bankCard_id);
	}

	@Override
	public List<BankCard> getBankCardByNumber(int number) {
		return bankCardDao.getBankCardByNumber(number);
	}

	@Override
	public void updateBankCard(BankCard bankCard) {
		bankCardDao.update(bankCard);
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
	public List<Manager> getAllManagers() {
		return managerDao.getAllManagers();
	}

	@Override
	public Manager getManagerById(int manager_id) {
		return managerDao.getManagerById(manager_id);
	}

	@Override
	public List<Member> getAllMembers() {
		return memberDao.getAllMembers();
	}

	@Override
	public Member getMemberById(int member_id) {
		return memberDao.getMemberById(member_id);
	}

	@Override
	public Integer getIdByAccount(String account) {
		return memberDao.getIdByAccount(account);
	}

	@Override
	public void updateMember(Member member) {
		memberDao.update(member);
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
	public List<Payment> getAllPayments() {
		return paymentDao.getAllPayments();
	}

	@Override
	public Payment getPaymentById(int payment_id) {
		return paymentDao.getPaymentById(payment_id);
	}

	@Override
	public List<Payment> getPaymentByMemberId(int member_id) {
		return paymentDao.getPaymentByMemberId(member_id);
	}

	@Override
	public Integer addPayment(Payment payment) {
		return paymentDao.save(payment);
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
	public List<Waiter> getAllWaiters() {
		return waiterDao.getAllWaiters();
	}

	@Override
	public Waiter getWaitertById(int waiter_id) {
		return waiterDao.getWaiterById(waiter_id);
	}

	@Override
	public void autoMember() {
		
		System.out.println("In AutoMember");
		
		List<Member> members = memberDao.getAllMembers();
		for (int i = 0; i < members.size(); i++) {
			Member member = members.get(i);
			String member_state = member.getMember_state();

			String register_time = member.getRegister_time();
			long days = getDays(register_time);

			// 会员状态：恢复->暂停
			if (member_state.equals("recover") && days > 365
					&& member.getBalance() < 0) {
				member.setMember_state("pause");
				updateMember(member);
			}

			// 会员状态：暂停->停止
			else if (member_state.equals("pause") && days > (365 * 2)) {
				member.setMember_state("stop");
				updateMember(member);
			}
		}
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

}
