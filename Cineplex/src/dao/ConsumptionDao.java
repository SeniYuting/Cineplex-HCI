package dao;

import java.util.List;

import model.Consumption;

public interface ConsumptionDao {
	
	public Integer save(Consumption consumption);

	public List<Consumption> getConsumptionById(int consumption_id);
	
	public List<Consumption> getConsumptionByMemberId(int member_id);
	
	public List<Consumption> getConsumptionByMemberIdAndMovieId(int member_id, int movie_id);
	
	public List<Consumption> getAllConsumptions();
	
	public List<Consumption> getConsumptionByMovieId(int movie_id);

}