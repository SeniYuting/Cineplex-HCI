package action;

import java.io.PrintWriter;
import java.util.List;

import model.Answer;
import service.MemberService;

public class AnswerQuestionAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String answer;

	private MemberService memberService;

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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

		if (!((member_state.equals("stop")) || (member_state.equals("cancel")))) {

			int question_id = Integer.parseInt(request().getParameter(
					"question_id"));

			List<Answer> member_answers = memberService
					.getAnswerByQusIdandMemId(question_id, member_id);

			if (member_answers.size() == 0) {
				// ����δ�ش�
				List<Answer> answers = memberService.getAllAnswers();
				int id = answers.size();

				Answer member_answer = new Answer(id, question_id, member_id,
						answer);
				int result = memberService.addAnswer(member_answer);

				if (result >= 0) {
					out.print("<script>alert('Answer Successfully!')</script>");
				}

			} else {
				// �����ѻش𣬸��´�
				Answer submitted_answer = member_answers.get(0);
				submitted_answer.setAnswer(answer);
				memberService.updateAnswer(submitted_answer);
				out.print("<script>alert('Answer Submitted Before! And Now Answer is Updated!')</script>");
			}
		}else {
			// ��ԱStop��Cancel
			out.print("<script>alert('Error! Stop or Cancel Member!')</script>");
		}

		out.print("<script>window.location.href='activityArrangePro'</script>");
		out.flush();
		out.close();

		return SUCCESS;
	}

}
