package action;

import java.io.PrintWriter;
import java.util.List;

import model.Consumption;
import model.Member;
import model.Movie;
import service.MemberService;

public class TicketBookAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String number;

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute() throws Exception {
		int member_id = (int) session().getAttribute("account_id");
		int movie_id = Integer.parseInt(request().getParameter("movie_id"));

		String member_state = memberService.getMemberById(member_id)
				.getMember_state();

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		Movie movie = memberService.getMovieById(movie_id);

		if (!((member_state.equals("stop")) || (member_state.equals("cancel")) || (member_state.equals("pause")))) {

			Member member = memberService.getMemberById(member_id);

			if (member != null) {
				boolean state = member.getState();
				if (state == true) {
					// 卡激活
					List<Consumption> consumptions = memberService
							.getConsumptionByMovieId(movie_id);

					int size = consumptions.size();
					int movie_seat = movie.getSeat();

					int num = Integer.parseInt(number);

					if ((size + num) <= movie_seat) {
						// 电影未销售完毕

						List<Consumption> consumptionList = memberService
								.getAllConsumptions();
						int list_Size = consumptionList.size();

						for (int i = 0; i < num; i++) {
							int member_seat = size + 1 + i;
							Consumption consumption = new Consumption(list_Size
									+ i, member_id, movie_id, member_seat,
									"Card", movie.getName(), movie.getPeriod(),
									movie.getHall());
							memberService.addConsumption(consumption);
						}

						// 预约成功，扣款，不同会员级别享受不同优惠，获得积分
						int level = member.getLevel();
						int movie_price = movie.getPrice() - level;

						int money = member.getBalance() - movie_price * num;

						// 若会员欠费超过200，停止会员
						if (money < -200) {
							member.setMember_state("stop");
						}

						// 等级变化
						if (money > 300 && money <= 600)
							member.setLevel(1);
						else if (money > 600 && money <= 900)
							member.setLevel(2);
						else if (money > 900)
							member.setLevel(3);
						else if (money <= 300)
							member.setLevel(0);

						member.setBalance(money);
						member.setCredit(member.getCredit() + num);

						memberService.updateMember(member);
						out.print("<script>alert('Book Successfully!')</script>");

					} else {
						// 电影销售完毕
						out.print("<script>alert('Error! Book Completed!')</script>");
					}
				} else {
					// 卡未激活
					out.print("<script>alert('Error! Card is Invalid!')</script>");
				}
			}
		} else {
			// 会员Stop或Cancel或pause
			out.print("<script>alert('Error! Stop or Cancel or Pause Member!')</script>");
		}

		out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/oneMoviePro?movie_name="
				+ movie.getName() + "'</script>");

		out.flush();
		out.close();

		return SUCCESS;
	}
}
