package paymentsIndia;

public class NetBanking implements PaymentGateway{

	@Override
	public void pay() {
		System.out.println("Paying through net banking !!");
	}

}
