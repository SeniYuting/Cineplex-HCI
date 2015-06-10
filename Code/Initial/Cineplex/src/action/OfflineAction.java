package action;

import java.io.PrintWriter;
import java.util.List;

import model.Answer;
import model.Member;
import model.Movie;
import model.Question;
import service.ManagerService;

public class OfflineAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ManagerService managerService;

	public ManagerService getManagerService() {
		return managerService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public String execute() throws Exception {

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		String movie_name = request().getParameter("movie_name");
		int movie_id = managerService.getMovieIdByName(movie_name);
		Movie movie = managerService.getMovieById(movie_id);

		// 电影下线
		movie.setIsOn(0);
		managerService.updateMovie(movie);

		// 会员积分 如75%选择好评，则选择好评的会员可获得问题积分
		List<Question> questions = managerService
				.getQuestionsByMovieId(movie_id);
		for (int i = 0; i < questions.size(); i++) {
			Question question = questions.get(i);
			List<Answer> answers = managerService
					.getAnswersByQuestionId(question.getId());
			int a1Num = 0, a2Num = 0, a3Num = 0;
			for (int j = 0; j < answers.size(); j++) {
				Answer oneAnswer1 = answers.get(j);
				if (oneAnswer1.getAnswer().equals("a1"))
					a1Num++;
				else if (oneAnswer1.getAnswer().equals("a2"))
					a2Num++;
				else
					a3Num++;
			}

			int max = Math.max(Math.max(a1Num, a2Num), a3Num);

			if (max >= (float) (0.75 * answers.size())) {

				String trueAnswer = "a3";
				if (max == a1Num) {
					trueAnswer = "a1";
				} else if (max == a2Num) {
					trueAnswer = "a2";
				}

				for (int j = 0; j < answers.size(); j++) {
					Answer oneAnswer2 = answers.get(j);
					if (oneAnswer2.getAnswer().equals(trueAnswer)) {
						int member_id = oneAnswer2.getMember_id();
						Member member = managerService.getMemberById(member_id);

						int credit = question.getCredit();
						member.setCredit(member.getCredit() + credit);

						managerService.updateMember(member);
					}
				}
			}
		}

		out.print("<script>alert('Offline Successfully!')</script>");
		out.print("<script>window.location.href='http://localhost:8080/Cineplex/jsp/allOfflineMoviesPro'</script>");
		out.flush();
		out.close();

		return SUCCESS;
	}

}
