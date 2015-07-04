package dao.impl;

import java.util.List;

import model.Waiter;
import dao.WaiterDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class WaiterDaoImpl extends YeekuHibernateDaoSupport implements
		WaiterDao {

	@Override
	public Integer save(Waiter waiter) {
		return (Integer) getHibernateTemplate().save(waiter);
	}

	@Override
	public Waiter getWaiterById(int waiter_id) {
		@SuppressWarnings("unchecked")
		List<Waiter> waiters = (List<Waiter>) getHibernateTemplate().find(
				"from Waiter as w where w.id=?", waiter_id);
		Waiter waiter = waiters.get(0);
		return waiter;
	}

	@Override
	public List<Waiter> getAllWaiters() {
		@SuppressWarnings("unchecked")
		List<Waiter> waiters = (List<Waiter>) getHibernateTemplate().find(
				"from Waiter");
		return waiters;
	}

	@Override
	public boolean findByAccountAndPassword(Waiter waiter) {
		@SuppressWarnings("unchecked")
		List<Waiter> result = (List<Waiter>) getHibernateTemplate().find(
				"from Waiter as w where " + "w.account=? and w.password=?",
				waiter.getAccount(), waiter.getPassword());
		if (result.size() != 0) {
			return true;
		}
		return false;
	}

}
