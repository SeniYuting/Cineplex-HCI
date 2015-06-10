package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import model.BankCard;
import model.Consumption;
import model.Member;
import model.Movie;
import model.Payment;
import service.WaiterService;
import vo.ConsumptionRecordVO;
import vo.PaymentRecordVO;

public class QueryAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String memberId;

	private WaiterService waiterService;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setWaiterService(WaiterService waiterService) {
		this.waiterService = waiterService;
	}

	@Override
	public String execute() throws Exception {

		if (isNumberOK(memberId)) {
			int member_id = Integer.parseInt(memberId) - 1000000;
			Member member = waiterService.getMemberById(member_id);
			request().setAttribute("member", member);
			
			List<Consumption> consumptions = waiterService
					.getConsumptionByMemberId(member_id);
			List<ConsumptionRecordVO> consumptionRecordList = new ArrayList<ConsumptionRecordVO>();

			if (consumptions.size() == 0)
				request().setAttribute("noConsumption", "true");

			for (int i = 0; i < consumptions.size(); i++) {
				Consumption consumption = consumptions.get(i);
				int movie_id = consumption.getMovie_id();
				Movie movie = waiterService.getMovieById(movie_id);

				ConsumptionRecordVO comsumptionRecord = new ConsumptionRecordVO(
						movie.getName(), movie.getPeriod(), movie.getHall(),
						consumption.getSeat(), movie.getPrice());
				consumptionRecordList.add(comsumptionRecord);
			}

			request().setAttribute("consumptionRecordList", consumptionRecordList);

			List<Payment> payments = waiterService.getPaymentByMemberId(member_id);
			List<PaymentRecordVO> paymentRecordList = new ArrayList<PaymentRecordVO>();

			if (payments.size() == 0)
				request().setAttribute("noPayment", "true");

			for (int i = 0; i < payments.size(); i++) {
				Payment payment = payments.get(i);
				int bankCard_id = payment.getBankcard_id();
				BankCard bankCard = waiterService.getBankCardById(bankCard_id);

				PaymentRecordVO paymentRecord = new PaymentRecordVO(
						bankCard.getNumber(), payment.getTime(), payment.getFee());
				paymentRecordList.add(paymentRecord);
			}

			request().setAttribute("paymentRecordList", paymentRecordList);

		} else {
			response().setContentType("text/html;charset=UTF-8");
			response().setCharacterEncoding("UTF-8");
			PrintWriter out = response().getWriter();

			out.print("<script>alert('MemberId Error!')</script>");
			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/query.jsp?query=0'</script>");
			out.flush();
			out.close();
		}

		return SUCCESS;
	}

	public boolean isNumberOK(String str) {
		if (str.length() != 7)
			return false;
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}

}
