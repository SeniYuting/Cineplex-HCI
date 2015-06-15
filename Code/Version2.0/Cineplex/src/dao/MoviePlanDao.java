package dao;

import java.util.List;

import model.MoviePlan;

public interface MoviePlanDao {
	
	public Integer save(MoviePlan movieplan);

	public MoviePlan getMoviePlanById(int moviePlan_id);
	
	public int getMoviePlanIdByName(String moviePlan_name);
	
	public List<MoviePlan> getAllMoviePlans();
	
	public void delete(MoviePlan moviePlan);

	public void update(MoviePlan moviePlan);
	
}
