package action;

import java.util.ArrayList;
import java.util.List;

import model.BankCard;
import model.Consumption;
import model.Movie;
import model.Payment;
import service.MemberService;
import vo.ConsumptionRecordVO;
import vo.PaymentRecordVO;

public class RecordAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute() throws Exception {

		int member_id = (int) session().getAttribute("account_id");

		List<Consumption> consumptions = memberService
				.getConsumptionByMemberId(member_id);
		List<ConsumptionRecordVO> consumptionRecordList = new ArrayList<ConsumptionRecordVO>();

		if (consumptions.size() == 0)
			request().setAttribute("noConsumption", "true");

		for (int i = 0; i < consumptions.size(); i++) {
			Consumption consumption = consumptions.get(i);
			int movie_id = consumption.getMovie_id();
			Movie movie = memberService.getMovieById(movie_id);

			ConsumptionRecordVO comsumptionRecord = new ConsumptionRecordVO(
					movie.getName(), movie.getPeriod(), movie.getHall(),
					consumption.getSeat(), movie.getPrice());
			consumptionRecordList.add(comsumptionRecord);
		}

		request().setAttribute("consumptionRecordList", consumptionRecordList);

		List<Payment> payments = memberService.getPaymentByMemberId(member_id);
		List<PaymentRecordVO> paymentRecordList = new ArrayList<PaymentRecordVO>();

		if (payments.size() == 0)
			request().setAttribute("noPayment", "true");

		for (int i = 0; i < payments.size(); i++) {
			Payment payment = payments.get(i);
			int bankCard_id = payment.getBankcard_id();
			BankCard bankCard = memberService.getBankCardById(bankCard_id);

			PaymentRecordVO paymentRecord = new PaymentRecordVO(
					bankCard.getNumber(), payment.getTime(), payment.getFee());
			paymentRecordList.add(paymentRecord);
		}

		request().setAttribute("paymentRecordList", paymentRecordList);

		return SUCCESS;
	}

}
