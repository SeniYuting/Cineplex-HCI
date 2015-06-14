package dao.impl;

import java.util.List;

import model.Movie;
import dao.MovieDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class MovieDaoImpl extends YeekuHibernateDaoSupport implements MovieDao {

	@Override
	public Integer save(Movie movie) {
		return (Integer) getHibernateTemplate().save(movie);
	}

	@Override
	public Movie getMovieById(int movie_id) {
		@SuppressWarnings("unchecked")
		List<Movie> movies = (List<Movie>) getHibernateTemplate().find(
				"from Movie as mv where mv.id=?", movie_id);
		Movie movie = movies.get(0);
		return movie;
	}

	@Override
	public int getMovieIdByName(String movie_name) {
		@SuppressWarnings("unchecked")
		List<Movie> movies = (List<Movie>) getHibernateTemplate().find(
				"from Movie as mv where mv.name=?", movie_name);
		if (movies.size() > 0) {
			int movie_id = movies.get(0).getId();
			return movie_id;
		} else {
			return -1;
		}
	}
	
	@Override
	public int getMovieIdByNameAndPeriod(String movie_name, String movie_period) {
		@SuppressWarnings("unchecked")
		List<Movie> movies = (List<Movie>) getHibernateTemplate().find(
				"from Movie as mv where mv.name=? and mv.period=?", movie_name, movie_period);
		if (movies.size() > 0) {
			int movie_id = movies.get(0).getId();
			return movie_id;
		} else {
			return -1;
		}
	}

	@Override
	public List<Movie> getAllMovies() {

		@SuppressWarnings("unchecked")
		List<Movie> movies = (List<Movie>) getHibernateTemplate().find(
				"from Movie");
		return movies;
	}
	
	@Override
	public void update(Movie movie) {
		getHibernateTemplate().merge(movie);
	}

}
