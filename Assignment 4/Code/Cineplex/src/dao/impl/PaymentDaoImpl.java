package dao.impl;

import java.util.List;

import model.Payment;
import dao.PaymentDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class PaymentDaoImpl extends YeekuHibernateDaoSupport implements
		PaymentDao {

	@Override
	public Integer save(Payment payment) {
		return (Integer) getHibernateTemplate().save(payment);
	}

	@Override
	public Payment getPaymentById(int payment_id) {
		@SuppressWarnings("unchecked")
		List<Payment> payments = (List<Payment>) getHibernateTemplate().find(
				"from Payment as p where p.id=?", payment_id);
		Payment payment = payments.get(0);
		return payment;
	}

	@Override
	public List<Payment> getPaymentByMemberId(int member_id) {
		@SuppressWarnings("unchecked")
		List<Payment> payments = (List<Payment>) getHibernateTemplate().find(
				"from Payment as p where p.member_id=?", member_id);
		return payments;
	}

	@Override
	public List<Payment> getAllPayments() {

		@SuppressWarnings("unchecked")
		List<Payment> payments = (List<Payment>) getHibernateTemplate().find(
				"from Payment");
		return payments;
	}

}
