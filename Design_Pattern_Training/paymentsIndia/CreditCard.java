package paymentsIndia;

public class CreditCard implements PaymentGateway{

	@Override
	public void pay() {
		System.out.println("Paying through credit card !!");
	}

}
