package paymentsIndia;

import java.util.Scanner;

public class PaymentsIndiaDemo {
	public static void main(String[] args){
		
		PaymentFactory factory = new PaymentFactory();
		PaymentGateway paymentGateway ;
		System.out.println("Welcome to Amazon e-commerce payment portal.");
		Scanner sc = new Scanner(System.in);
		System.out.println("Select from the various payment gateways : ");
		System.out.println("1 : Credit Card.");
		System.out.println("2 : Debit Card.");
		System.out.println("3 : Net Banking.");
		System.out.println("4 : Wallets");
		System.out.println("5 : Cash on Delivery.");
		System.out.println("0 : To cancel the transaction.");
		try{
			int input = sc.nextInt();	
			switch (input) {
				case 0:
					System.out.println("Transaction has been cancelled.");
					break;
				case 1:
					paymentGateway = factory.getPaymentGateway("CreditCard");
					paymentGateway.pay();
					break;
				case 2:
					paymentGateway = factory.getPaymentGateway("DebitCard");
					paymentGateway.pay();
					break;
				case 3:
					paymentGateway = factory.getPaymentGateway("NetBanking");
					paymentGateway.pay();
					break;
				case 4:
					paymentGateway = factory.getPaymentGateway("Wallets");
					paymentGateway.pay();
					break;
				case 5:
					paymentGateway = factory.getPaymentGateway("CashOnDelivery");
					paymentGateway.pay();
					break;
				default:
					System.out.println("Invalid input.");
					break;
				}
			}
			catch(Exception e){
				System.err.print(e);
			}
		System.out.println("Thanks for using Amazon e-commerce payment portal.");
		sc.close();
	}
}
