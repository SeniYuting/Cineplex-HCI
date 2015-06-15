package dao.impl;

import java.util.List;

import model.Manager;
import dao.ManagerDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class ManagerDaoImpl extends YeekuHibernateDaoSupport implements
		ManagerDao {

	@Override
	public Integer save(Manager manager) {
		return (Integer) getHibernateTemplate().save(manager);
	}

	@Override
	public Manager getManagerById(int manager_id) {
		@SuppressWarnings("unchecked")
		List<Manager> managers = (List<Manager>) getHibernateTemplate().find(
				"from Manager as m where m.id=?", manager_id);
		Manager manager = managers.get(0);
		return manager;
	}

	@Override
	public List<Manager> getAllManagers() {
		@SuppressWarnings("unchecked")
		List<Manager> managers = (List<Manager>) getHibernateTemplate().find(
				"from Manager");
		return managers;
	}

	@Override
	public boolean findByAccountAndPassword(Manager manager) {
		@SuppressWarnings("unchecked")
		List<Manager> result = (List<Manager>) getHibernateTemplate().find(
				"from Manager as m where " + "m.account=? and m.password=?",
				manager.getAccount(), manager.getPassword());
		if (result.size() != 0) {
			return true;
		}
		return false;
	}

}
