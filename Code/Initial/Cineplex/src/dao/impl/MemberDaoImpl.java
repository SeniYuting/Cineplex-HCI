package dao.impl;

import java.util.List;

import model.Member;
import dao.MemberDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class MemberDaoImpl extends YeekuHibernateDaoSupport implements
		MemberDao {

	@Override
	public Integer save(Member member) {
		return (Integer) getHibernateTemplate().save(member);
	}

	@Override
	public Member getMemberById(int member_id) {
		@SuppressWarnings("unchecked")
		List<Member> members = (List<Member>) getHibernateTemplate().find(
				"from Member as m where m.id=?", member_id);
		if (members.size() > 0) {
			Member member = members.get(0);
			return member;
		} else {
			return null;
		}
	}

	@Override
	public List<Member> getAllMembers() {
		@SuppressWarnings("unchecked")
		List<Member> members = (List<Member>) getHibernateTemplate().find(
				"from Member");
		return members;
	}

	@Override
	public boolean findByAccountAndPassword(Member member) {
		@SuppressWarnings("unchecked")
		List<Member> result = (List<Member>) getHibernateTemplate().find(
				"from Member as m where m.account=? and m.password=?",
				member.getAccount(), member.getPassword());
		if (result.size() != 0) {
			return true;
		}
		return false;
	}

	@Override
	public Integer getIdByAccount(String account) {
		@SuppressWarnings("unchecked")
		List<Member> result = (List<Member>) getHibernateTemplate().find(
				"from Member as m where m.account=?", account);
		if (result.size() != 0) {
			int id = result.get(0).getId();
			return id;
		}
		return -1;
	}

	@Override
	public boolean findByAccount(Member member) {
		@SuppressWarnings("unchecked")
		List<Member> result = (List<Member>) getHibernateTemplate().find(
				"from Member as m where " + "m.account=?", member.getAccount());
		if (result.size() != 0)
			return true;
		return false;
	}

	@Override
	public void update(Member member) {
		getHibernateTemplate().merge(member);
	}

}
