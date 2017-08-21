package paymentsIndia;

public class Wallets implements PaymentGateway{
	@Override
	public void pay() {
		System.out.println("Paying through wallets !!");
	}

}
