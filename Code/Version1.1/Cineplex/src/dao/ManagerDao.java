package dao;

import java.util.List;

import model.Manager;

public interface ManagerDao {
	
	public Integer save(Manager manager);

	public Manager getManagerById(int manager_id);
	
	public List<Manager> getAllManagers();
	
	boolean findByAccountAndPassword(Manager manager);

}