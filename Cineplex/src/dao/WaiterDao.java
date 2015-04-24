package dao;

import java.util.List;

import model.Waiter;

public interface WaiterDao {
	
	public Integer save(Waiter waiter);

	public Waiter getWaiterById(int waiter_id);
	
	public List<Waiter> getAllWaiters();
	
	boolean findByAccountAndPassword(Waiter waiter);

}