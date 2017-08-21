package paymentsIndia;

public class CashOnDelivery implements PaymentGateway{

	@Override
	public void pay() {
		System.out.println("Paying through cash on delivery !!");
	}

}
