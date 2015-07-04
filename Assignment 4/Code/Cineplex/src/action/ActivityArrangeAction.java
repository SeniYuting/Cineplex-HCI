package action;

import java.util.ArrayList;
import java.util.List;

import model.Answer;
import model.Consumption;
import model.Movie;
import model.Question;
import service.MemberService;
import vo.ActivityVO;

public class ActivityArrangeAction extends BaseAction {
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

		List<Consumption> consumptions = memberService
				.getConsumptionByMemberId(member_id);
		List<ActivityVO> activityList = new ArrayList<ActivityVO>();
		List<Integer> movieIdList = new ArrayList<Integer>();

		if (consumptions.size() == 0)
			request().setAttribute("noQuestion", "true");

		for (int i = 0; i < consumptions.size(); i++) {
			Consumption consumption = consumptions.get(i);
			int movie_id = consumption.getMovie_id();
			if (!movieIdList.contains(movie_id)) {
				movieIdList.add(movie_id);
				Movie movie = memberService.getMovieById(movie_id);
				int isOn = movie.getIsOn();
				if (isOn == 1) {
					List<Question> questions = memberService
							.getQuestionsByMovieId(movie_id);
					for (int j = 0; j < questions.size(); j++) {

						int question_id = questions.get(j).getId();
						List<Answer> member_answers = memberService
								.getAnswerByQusIdandMemId(question_id,
										member_id);
						ActivityVO activity;
						if (member_answers.size() != 0) { // 该用户已回答过该问题

							activity = new ActivityVO(movie.getName(),
									movie.getIntroduction(), movie.getPic(),
									questions.get(j).getQuestion(), questions
											.get(j).getQuesoption(), questions
											.get(j).getCredit(), questions.get(
											j).getId(), "Update",
									member_answers.get(0).getAnswer());
						} else { // 该用户未回答过该问题
							activity = new ActivityVO(movie.getName(),
									movie.getIntroduction(), movie.getPic(),
									questions.get(j).getQuestion(), questions
											.get(j).getQuesoption(), questions
											.get(j).getCredit(), questions.get(
											j).getId(), "Submit", "");
						}
						activityList.add(activity);
					}
				}
			}
		}

		request().setAttribute("activityList", activityList);

		return SUCCESS;
	}

}