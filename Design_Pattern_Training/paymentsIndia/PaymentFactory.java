package paymentsIndia;

public class PaymentFactory {
	/**
	 * Create instance of respective payement gateway 
	 * @param gateway
	 * @return the instance of payement gateway
	 */
	public PaymentGateway getPaymentGateway(String gateway){
		if(gateway == null){
			return null;
		}
		else if (gateway.equalsIgnoreCase("cashondelivery")){
			return new CashOnDelivery();
		}
		else if(gateway.equalsIgnoreCase("creditcard")){
			return new CreditCard();
		}
		else if(gateway.equalsIgnoreCase("debitcard")){
			return new DebitCard();
		}
		else if(gateway.equalsIgnoreCase("netbanking")){
			return new NetBanking();
		}
		else if(gateway.equalsIgnoreCase("wallets")){
			return new Wallets();
		}
		else{
			return null;
		}
	}
}
