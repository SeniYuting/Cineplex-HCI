package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;

import model.BankCard;
import model.Member;
import model.Payment;
import service.MemberService;

public class ChargeAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int number;
	private String password;
	private int fee;

	private MemberService memberService;

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPassword(String password) {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute() throws Exception {
		int member_id = (int) session().getAttribute("account_id");

		String member_state = memberService.getMemberById(member_id)
				.getMember_state();

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		if (!((member_state.equals("stop")) || (member_state.equals("cancel")) || (member_state.equals("pause")))) {

			List<BankCard> bankCards = memberService
					.getBankCardByNumber(number);

			if (bankCards.size() > 0
					&& bankCards.get(0).getPassword().equals(password)) {
				// 银行卡存在且密码正确
				BankCard bankCard = bankCards.get(0);
				int bankCard_balance = bankCard.getBalance();

				if (bankCard_balance >= fee) {
					// 余额充足，充值
					Member member = memberService.getMemberById(member_id);
					boolean state = member.getState();

					if (state == false && fee >= 200) {
						// 未激活->激活
						state = true;
						member.setState(state);
					}
					// 添加缴费记录
					List<Payment> payments = memberService.getAllPayments();
					int id = payments.size();

					int bankCard_id = bankCard.getId();

					SimpleDateFormat df = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");// 设置日期格式
					String time = df.format(new Date()); // new Date()为获取当前系统时间

					Payment payment = new Payment(id, member_id, bankCard_id,
							time, fee);
					memberService.addPayment(payment);

					// 银行卡余额减少
					bankCard.setBalance(bankCard_balance - fee);
					memberService.updateBankCard(bankCard);

					// 会员余额增加，会员级别变化
					int memberCard_balance = member.getBalance() + fee;
					member.setBalance(memberCard_balance);

					if (memberCard_balance > 300 && memberCard_balance <= 600) {
						member.setLevel(1);
					} else if (memberCard_balance > 600
							&& memberCard_balance <= 900) {
						member.setLevel(2);
					} else if (memberCard_balance > 900) {
						member.setLevel(3);
					}

					// 会员状态：暂停->恢复 充值行为
					if (member.getMember_state().equals("pause")
							&& memberCard_balance >= 0) {
						member.setMember_state("recover");
					}

					memberService.updateMember(member);

					out.print("<script>alert('Charge Successfully!')</script>");
					out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/infoPro?modify=1&charge=1'</script>");

				} else {
					out.print("<script>alert('Insufficient Balance!')</script>");
					out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/infoPro?modify=1&charge=2'</script>");
				}
			} else {
				out.print("<script>alert('Card Number or Password Error!')</script>");
				out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/infoPro?modify=1&charge=2'</script>");
			}
		} else {
			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/infoPro?modify=1&charge=1'</script>");
		}

		out.flush();
		out.close();

		return SUCCESS;
	}
}
