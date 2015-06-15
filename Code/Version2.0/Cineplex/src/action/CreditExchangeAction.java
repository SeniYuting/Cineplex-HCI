package action;

import java.io.PrintWriter;

import model.Member;
import service.MemberService;

public class CreditExchangeAction extends BaseAction {
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

		Member member = memberService.getMemberById(member_id);

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		if (member.getCredit() >= 10) {
			member.setCredit(member.getCredit() - 10);
			member.setBalance(member.getBalance() + 1);
			memberService.updateMember(member);

			out.print("<script>alert('Exchange Successfully!')</script>");
		} else {
			out.print("<script>alert('Credit is Less than 10!')</script>");
		}
		out.print("<script>window.location.href='infoPro?modify=1'</script>");

		out.flush();
		out.close();

		return SUCCESS;
	}
}
