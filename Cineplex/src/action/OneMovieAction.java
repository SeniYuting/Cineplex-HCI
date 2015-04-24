package action;

import model.Movie;
import service.MemberService;

public class OneMovieAction extends BaseAction {
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
		
		String movie_name = request().getParameter("movie_name");
		
		int movie_id = memberService.getMovieIdByName(movie_name);
		
		Movie movie = memberService.getMovieById(movie_id);
		request().setAttribute("movie", movie);

		return SUCCESS;
	}

}
