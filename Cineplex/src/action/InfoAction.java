package action;

import model.Member;
import service.MemberService;

public class InfoAction extends BaseAction {
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

		request().setAttribute("member", member);

		return SUCCESS;
	}

}
