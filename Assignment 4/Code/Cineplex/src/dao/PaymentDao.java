package dao;

import java.util.List;

import model.Payment;

public interface PaymentDao {
	
	public Integer save(Payment payment);

	public Payment getPaymentById(int payment_id);
	
	public List<Payment> getPaymentByMemberId(int member_id);
	
	public List<Payment> getAllPayments();

}