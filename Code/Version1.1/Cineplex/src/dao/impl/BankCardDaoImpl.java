package dao.impl;

import java.util.List;

import model.BankCard;
import dao.BankCardDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class BankCardDaoImpl extends YeekuHibernateDaoSupport implements BankCardDao {

	@Override
	public Integer save(BankCard bankCard) {
		return (Integer)getHibernateTemplate().save(bankCard);
	}

	@Override
	public BankCard getBankCardById(int bankCard_id) {
		@SuppressWarnings("unchecked")
		List<BankCard> bankCards = (List<BankCard>) getHibernateTemplate().find("from BankCard as bc where bc.id=?", bankCard_id);
		BankCard bankCard = bankCards.get(0);
		return bankCard;
	}
	
	@Override
	public List<BankCard> getBankCardByNumber(int number) {
		@SuppressWarnings("unchecked")
		List<BankCard> bankCards = (List<BankCard>) getHibernateTemplate().find("from BankCard as bc where bc.number=?", number);
		return bankCards;
	}

	@Override
	public List<BankCard> getAllBankCards() {
		
		@SuppressWarnings("unchecked")
		List<BankCard> bankCards = (List<BankCard>)
				getHibernateTemplate().find("from BankCard");
		return bankCards;
	}
	
	@Override
	public void update(BankCard bankCard) {
		getHibernateTemplate().merge(bankCard);
	}

}
