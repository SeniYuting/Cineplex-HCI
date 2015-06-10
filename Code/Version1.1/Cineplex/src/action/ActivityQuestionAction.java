package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import model.Movie;
import model.Question;
import service.WaiterService;

public class ActivityQuestionAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String movies;
	private String question;
	private String quesoption1;
	private String quesoption2;
	private String quesoption3;
	private String credit;

	private WaiterService waiterService;

	public String getMovies() {
		return movies;
	}

	public void setMovies(String movies) {
		this.movies = movies;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getQuesoption1() {
		return quesoption1;
	}

	public void setQuesoption1(String quesoption1) {
		this.quesoption1 = quesoption1;
	}

	public String getQuesoption2() {
		return quesoption2;
	}

	public void setQuesoption2(String quesoption2) {
		this.quesoption2 = quesoption2;
	}

	public String getQuesoption3() {
		return quesoption3;
	}

	public void setQuesoption3(String quesoption3) {
		this.quesoption3 = quesoption3;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public WaiterService getWaiterService() {
		return waiterService;
	}

	public void setWaiterService(WaiterService waiterService) {
		this.waiterService = waiterService;
	}

	@Override
	public String execute() throws Exception {

		response().setContentType("text/html;charset=UTF-8");
		response().setCharacterEncoding("UTF-8");
		PrintWriter out = response().getWriter();

		if (movies == null) {
			out.print("<script>alert('At least choose one movie!')</script>");
		} else {

			String[] ms = movies.split(", ");

			ArrayList<String> movieList = new ArrayList<String>();
			for (int i = 0; i < ms.length; i++) {
				if (!ms[i].equals("")) {
					movieList.add(ms[i]);
				}
			}

			List<Question> questions = waiterService.getAllQuestions();

			for (int i = 0; i < movieList.size(); i++) {
				String movie_name = movieList.get(i).split("&&")[0];
				String movie_period = movieList.get(i).split("&&")[1];

				int movieId = waiterService.getMovieIdByNameAndPeriod(
						movie_name, movie_period);
				if (movieId != -1) {

					int id = questions.size() + i;
					Question q = new Question(id, movieId, question,
							quesoption1 + "&&" + quesoption2 + "&&"
									+ quesoption3, Integer.parseInt(credit));
					waiterService.addQuestion(q);

				}
			}

			List<Movie> movies = waiterService.getAllMovies();

			if (movies.size() == 0)
				request().setAttribute("noMovie", "true");

			List<Movie> newMovies = new ArrayList<Movie>();
			for (int i = 0; i < movies.size(); i++) {
				Movie movie = movies.get(i);
				if (movie.getIsOn() != 0)
					newMovies.add(movie);
			}

			request().setAttribute("movies", newMovies);

			out.print("<script>alert('Add Questions Successfully!')</script>");
		}

		out.print("<script>window.location.href='quesPro'</script>");
		out.flush();
		out.close();

		return SUCCESS;
	}

}
