package paymentsIndia;

public class DebitCard implements PaymentGateway{

	@Override
	public void pay() {
		System.out.println("Paying through debit card !!");
	}

}
