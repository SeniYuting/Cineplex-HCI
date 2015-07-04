package dao;

import java.util.List;

import model.Member;

public interface MemberDao {
	
	public Integer save(Member member);

	public Member getMemberById(int member_id);
	
	public List<Member> getAllMembers();
	
	public boolean findByAccountAndPassword(Member member);

	public Integer getIdByAccount(String account);
	
	public boolean findByAccount(Member member);
	
	public void update(Member member);
}