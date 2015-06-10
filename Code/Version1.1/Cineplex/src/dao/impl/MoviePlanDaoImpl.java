package dao.impl;

import java.util.List;

import model.MoviePlan;
import dao.MoviePlanDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class MoviePlanDaoImpl extends YeekuHibernateDaoSupport implements
		MoviePlanDao {

	@Override
	public Integer save(MoviePlan movieplan) {
		return (Integer) getHibernateTemplate().save(movieplan);
	}

	@Override
	public MoviePlan getMoviePlanById(int moviePlan_id) {
		@SuppressWarnings("unchecked")
		List<MoviePlan> moviePlans = (List<MoviePlan>) getHibernateTemplate()
				.find("from MoviePlan as mvp where mvp.id=?", moviePlan_id);
		MoviePlan moviePlan = moviePlans.get(0);
		return moviePlan;
	}

	@Override
	public int getMoviePlanIdByName(String moviePlan_name) {
		@SuppressWarnings("unchecked")
		List<MoviePlan> moviePlans = (List<MoviePlan>) getHibernateTemplate()
				.find("from MoviePlan as mvp where mvp.name=?", moviePlan_name);
		if (moviePlans.size() > 0) {
			int moviePlan_id = moviePlans.get(0).getId();
			return moviePlan_id;
		} else {
			return -1;
		}
	}

	@Override
	public List<MoviePlan> getAllMoviePlans() {

		@SuppressWarnings("unchecked")
		List<MoviePlan> moviePlans = (List<MoviePlan>) getHibernateTemplate()
				.find("from MoviePlan");
		return moviePlans;
	}

	@Override
	public void delete(MoviePlan moviePlan) {
		getHibernateTemplate().delete(moviePlan);
	}

	@Override
	public void update(MoviePlan moviePlan) {
		getHibernateTemplate().merge(moviePlan);
	}
	
}
