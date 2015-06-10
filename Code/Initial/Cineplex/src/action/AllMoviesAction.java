package action;

import java.util.ArrayList;
import java.util.List;

import model.Movie;
import service.MemberService;

public class AllMoviesAction extends BaseAction {
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

		List<Movie> movies = memberService.getAllMovies();

		if (movies.size() == 0)
			request().setAttribute("noMovie", "true");

		List<Movie> newMovies = new ArrayList<Movie>();
		for (int i = 0; i < movies.size(); i++) {
			Movie movie = movies.get(i);
			if (movie.getIsOn() != 0)
				newMovies.add(movie);
		}

		request().setAttribute("movies", newMovies);

		return SUCCESS;
	}

}
