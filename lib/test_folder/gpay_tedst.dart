import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class GpayTest extends StatefulWidget {
  const GpayTest({super.key});

  @override
  _GpayTestState createState() => _GpayTestState();
}

class _GpayTestState extends State<GpayTest> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clean up Razorpay instance
    super.dispose();
  }
   //'key': 'rzp_test_uQSuZaPnbxof71',
  void openCheckout() {
    var options = {
      'key': 'rzp_test_FHMbJJb5sxQ1Cu',
      'amount': 100, // Amount should be in paise (e.g., 100 = 1 INR)
      'name': 'Cruise Buddy',
      'order_id' : "order_PvwS5g5uKP5e4m",
      'description': 'Premium House Boat',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '8848055651',
        'email': 'test@razorpay.com',
      },
      'external': {
        'wallets': ['paytm'],
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata: ${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "Wallet: ${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Razorpay Payment")),
      body: Center(
        child: ElevatedButton(
          onPressed: openCheckout,
          child: const Text("Pay Now"),
        ),
      ),
    );
  }
}
