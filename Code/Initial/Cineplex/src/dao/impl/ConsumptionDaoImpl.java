package dao.impl;

import java.util.List;

import model.Consumption;
import dao.ConsumptionDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class ConsumptionDaoImpl extends YeekuHibernateDaoSupport implements
		ConsumptionDao {

	@Override
	public Integer save(Consumption consumption) {
		return (Integer) getHibernateTemplate().save(consumption);
	}

	@Override
	public List<Consumption> getConsumptionById(int consumption_id) {
		@SuppressWarnings("unchecked")
		List<Consumption> consumptions = (List<Consumption>) getHibernateTemplate()
				.find("from Consumption as c where c.id=?", consumption_id);
		return consumptions;
	}

	@Override
	public List<Consumption> getConsumptionByMemberId(int member_id) {
		@SuppressWarnings("unchecked")
		List<Consumption> consumptions = (List<Consumption>) getHibernateTemplate()
				.find("from Consumption as c where c.member_id=?", member_id);
		return consumptions;
	}

	public List<Consumption> getConsumptionByMemberIdAndMovieId(int member_id,
			int movie_id) {
		@SuppressWarnings("unchecked")
		List<Consumption> consumptions = (List<Consumption>) getHibernateTemplate()
				.find("from Consumption as c where c.member_id=? and c.movie_id=?",
						member_id, movie_id);
		return consumptions;
	}

	@Override
	public List<Consumption> getAllConsumptions() {

		@SuppressWarnings("unchecked")
		List<Consumption> consumptions = (List<Consumption>) getHibernateTemplate()
				.find("from Consumption");
		return consumptions;
	}

	@Override
	public List<Consumption> getConsumptionByMovieId(int movie_id) {
		@SuppressWarnings("unchecked")
		List<Consumption> consumptions = (List<Consumption>) getHibernateTemplate()
				.find("from Consumption as c where c.movie_id=?", movie_id);
		return consumptions;
	}

}
