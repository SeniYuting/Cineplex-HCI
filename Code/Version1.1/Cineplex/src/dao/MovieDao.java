package dao;

import java.util.List;

import model.Movie;

public interface MovieDao {
	
	public Integer save(Movie movie);

	public Movie getMovieById(int movie_id);
	
	public int getMovieIdByName(String movie_name);
	
	public int getMovieIdByNameAndPeriod(String movie_name, String movie_period);
	
	public List<Movie> getAllMovies();
	
	public void update(Movie movie);

}
