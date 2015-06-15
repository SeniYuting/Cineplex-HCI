package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

		Collections.sort(newMovies, new SortByMovieTime());
		request().setAttribute("movies", newMovies);

		return SUCCESS;
	}

}

class SortByMovieTime implements Comparator<Object> {
	public int compare(Object o1, Object o2) {
		Movie s1 = (Movie) o1;
		Movie s2 = (Movie) o2;
		if (s1.getPeriod().compareTo(s2.getPeriod()) > 0)
			return -1;
		else if (s1.getPeriod().compareTo(s2.getPeriod()) < 0) {
			return 1;
		}
		return 0;
	}
}
