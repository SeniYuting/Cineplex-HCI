package action;

import java.io.PrintWriter;

import model.Manager;
import model.Member;
import model.Waiter;
import service.ManagerService;
import service.MemberService;
import service.WaiterService;

import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String account;
	private String password;

	private MemberService memberService;
	private WaiterService waiterService;
	private ManagerService managerService;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setWaiterService(WaiterService waiterService) {
		this.waiterService = waiterService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public String execute() throws Exception {

		Member member = new Member(account, password);
		Waiter waiter = new Waiter(account, password);
		Manager manager = new Manager(account, password);
		ActionContext context = ActionContext.getContext();

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		if (memberService.checkLogin(member)) {
			System.out.println("Welcome Member!");
			context.getSession().put("accountType", "member");
			context.getSession().put("account", member.getAccount());
			int id = memberService.getIdByAccount(account);
			context.getSession().put("account_id", id);

			String member_state = memberService.getMemberById(id)
					.getMember_state();
			if (member_state.equals("stop")||member_state.equals("cancel")||(member_state.equals("pause"))) {
				out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/index.jsp?nomember=1'</script>");
			} else {
				out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/index.jsp'</script>");
			}

		} else if (waiterService.checkLogin(waiter)) {
			System.out.println("Welcome Waiter!");
			context.getSession().put("accountType", "waiter");
			context.getSession().put("account", waiter.getAccount());
			
			context.getSession().put("account_id", -1);

			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/index_w.jsp'</script>");
		} else if (managerService.checkLogin(manager)) {
			System.out.println("Welcome Manager!");
			context.getSession().put("accountType", "manager");
			context.getSession().put("account", manager.getAccount());
			
			context.getSession().put("account_id", -2);

			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/index_m.jsp'</script>");
		} else {
			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/login.jsp?error=1'</script>");
		}

		out.flush();
		out.close();

		return SUCCESS;
	}

}
