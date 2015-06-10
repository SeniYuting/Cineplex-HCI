package vo;

public class PaymentRecordVO {

	private int bankCardNumber;
	private String time;
	private int fee;

	public PaymentRecordVO() {
	}

	public PaymentRecordVO(int bankCardNumber, String time, int fee) {
		this.bankCardNumber = bankCardNumber;
		this.time = time;
		this.fee = fee;
	}

	public int getbankCardNumber() {
		return bankCardNumber;
	}

	public void setbankCardNumber(int bankCardNumber) {
		this.bankCardNumber = bankCardNumber;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

}
