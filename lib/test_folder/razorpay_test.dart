import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayTestScreen extends StatefulWidget {
  @override
  _RazorpayTestScreenState createState() => _RazorpayTestScreenState();
}

class _RazorpayTestScreenState extends State<RazorpayTestScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    // Initialize Razorpay
    _razorpay = Razorpay();

    // Listen to events from Razorpay
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  // Handle success event
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
   
      CustomToast.showFlushBar(
                    context: context,
                    status: true,
                    title: "Success",
                    content:" Payment Successful",
                  );
  }

  // Handle error event
  void _handlePaymentError(PaymentFailureResponse response) {
        CustomToast.showFlushBar(
                    context: context,
                    status: true,
                    title: "Oops",
                    content:"Payment Failed",
                  );
  
  }

  // Open Razorpay payment gateway
  void _openCheckout() {
    var options = {
      'key': 'rzp_live_9YK0kUaQLzZd55', // Your Razorpay Key
      'amount': 50000, // Payment amount in paise (e.g., 50000 = 500 INR)
      'name': 'Test Payment',
      'description': 'Test Transaction',
      //'order_id': 'order_123456', // Pass the orderId here
      'prefill': {'contact': '9999999999', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Don't forget to clear the Razorpay instance
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Razorpay Test Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: _openCheckout,
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}
