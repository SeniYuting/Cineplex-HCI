package action;

import java.io.PrintWriter;

import model.Member;
import service.MemberService;

public class ModifyInfoAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String uname;
	private String password1;
	private String password2;
	private String address;
	private String birthday;
	private String icon;

	private MemberService memberService;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute() throws Exception {
		int id = (int) session().getAttribute("account_id");

		Member member = memberService.getMemberById(id);

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		if (!password1.equals(password2)) {
			out.print("<script>alert('Password Disagree!')</script>");
			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/infoPro?modify=2&charge=1'</script>");
		} else {
			if (icon != null) {
				member.setIcon("../db/images/" + icon);
			}
			member.setName(uname);
			member.setPassword(password1);
			member.setAddress(address);
			member.setBirthday(birthday);

			memberService.updateMember(member);
			out.print("<script>alert('Modify Successfully!')</script>");
			out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/infoPro?modify=1&charge=1'</script>");
		}

		out.flush();
		out.close();
		return SUCCESS;
	}

}
