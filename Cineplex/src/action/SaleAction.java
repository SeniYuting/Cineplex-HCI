package action;

import java.io.PrintWriter;
import java.util.List;

import model.Consumption;
import model.Member;
import model.Movie;
import service.WaiterService;

public class SaleAction extends BaseAction {
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

	public WaiterService getWaiterService() {
		return waiterService;
	}

	public void setWaiterService(WaiterService waiterService) {
		this.waiterService = waiterService;
	}

	@Override
	public String execute() throws Exception {
		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		if (isNumberOK(memberId)) {
			String movie_name = request().getParameter("movie_name");
			int movie_id = waiterService.getMovieIdByName(movie_name);
			Movie movie = waiterService.getMovieById(movie_id);

			if (memberId.equals("0000000")) {
				// 无卡/现金售票
				List<Consumption> consumptions = waiterService
						.getConsumptionByMovieId(movie_id);

				int size = consumptions.size();
				int movie_seat = movie.getSeat();

				if (size < movie_seat) {
					// 电影未销售完毕
					List<Consumption> consumptionList = waiterService
							.getAllConsumptions();
					int list_Size = consumptionList.size();
					int member_seat = size + 1;
					Consumption consumption = new Consumption(list_Size, -2,
							movie_id, member_seat, "Cash", movie.getName(),
							movie.getPeriod(), movie.getHall());
					waiterService.addConsumption(consumption);
					out.print("<script>alert('Sale Successfully!')</script>");

				}
			} else {
				// 有卡售票
				int member_id = Integer.parseInt(memberId) - 1000000;
				Member member = waiterService.getMemberById(member_id);
				if (member == null) {
					// 会员号不存在
					out.print("<script>alert('MemberId Error!')</script>");
				} else {
					// 会员号存在
					String member_state = member.getMember_state();
					if (!((member_state.equals("stop")) || (member_state
							.equals("cancel"))||(member_state.equals("pause")))) {

						boolean state = member.getState();
						if (state == true) {
							// 卡激活
							List<Consumption> consumptions = waiterService
									.getConsumptionByMovieId(movie_id);

							int size = consumptions.size();
							int movie_seat = movie.getSeat();

							if (size < movie_seat) {
								// 电影未销售完毕
								List<Consumption> consumptionList = waiterService
										.getAllConsumptions();
								int list_Size = consumptionList.size();
								int member_seat = size + 1;
								Consumption consumption = new Consumption(
										list_Size, member_id, movie_id,
										member_seat, "Card", movie.getName(),
										movie.getPeriod(), movie.getHall());
								int result = waiterService
										.addConsumption(consumption);
								if (result >= 0) {
									// 预约成功，扣款，不同会员级别享受不同优惠，获得积分
									int level = member.getLevel();
									int movie_price = movie.getPrice() - level;

									int money = member.getBalance()
											- movie_price;

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
									member.setCredit(member.getCredit() + 1);
									waiterService.updateMember(member);
									out.print("<script>alert('Sale Successfully!')</script>");
								}
							} else {
								// 电影销售完毕
								out.print("<script>alert('Error! Book Completed!')</script>");
							}
						} else {
							// 卡未激活
							out.print("<script>alert('Error! Card is Invalid!')</script>");
						}
					} else {
						out.print("<script>alert('Member is Stop or Cancel or Pause!')</script>");
					}

				}

			}
		} else {
			out.print("<script>alert('MemberId must be 7 digits!')</script>");
		}
		out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/allBookMoviesPro'</script>");
		out.flush();
		out.close();

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
