package action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import model.Member;

import com.opensymphony.xwork2.ActionContext;

import service.MemberService;

public class RegisterAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String account;
	private String name;
	private String password;
	private String password2;
	private String address;
	private String gender;
	private String birthday;

	private MemberService memberService;

	private String password_disagree = "password_disagree";
	private String account_exist = "account_exist";
	private String account_error = "account_error";

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute() throws Exception {

		if (!password.equals(password2)) {
			return password_disagree;
		}
		if (memberService.getIdByAccount(account) != -1) {
			return account_exist;
		}
		if (account.equals("manager") || account.equals("waiter")) {
			return account_error;
		}

		ActionContext context = ActionContext.getContext();

		List<Member> members = memberService.getAllMembers();
		int id = members.size();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String time = df.format(new Date()); // new Date()为获取当前系统时间

		Member member = new Member(id, account, name, password, 0, address,
				gender, birthday, "../db/images/default.png", 1000000 + id,
				false, 0, 0, time, "recover");

		boolean result = memberService.registerMember(member);
		if (result) {
			context.getSession().put("accountType", "member");
			context.getSession().put("account", member.getAccount());
			int account_id = memberService.getIdByAccount(account);
			context.getSession().put("account_id", account_id);
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

}
