package dao;

import java.util.List;

import model.BankCard;

public interface BankCardDao {
	
	public Integer save(BankCard bankCard);

	public BankCard getBankCardById(int bankCard_id);
	
	public List<BankCard> getBankCardByNumber(int number);
	
	public List<BankCard> getAllBankCards();
	
	public void update(BankCard bankCard);

}