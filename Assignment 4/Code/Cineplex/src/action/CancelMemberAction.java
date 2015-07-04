package action;

import java.io.PrintWriter;

import model.Member;
import service.MemberService;

public class CancelMemberAction extends BaseAction {
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

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		Member member = memberService.getMemberById(member_id);
		
		member.setMember_state("cancel");
		memberService.updateMember(member);

		out.print("<script>alert('Cancel Successfully! If you want to Recover, Please goto the Cineplex!')</script>");
		out.print("<script>window.location.href='infoPro?modify=1'</script>");

		out.flush();
		out.close();

		return SUCCESS;
	}
}
