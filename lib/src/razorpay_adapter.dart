import 'dart:async';
import 'package:anypay/anypay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'razorpay_config.dart';

class RazorpayAdapter implements PaymentAdapter {
  final RazorpayConfig config;
  late Razorpay _razorpay;
  Completer<PaymentResult>? _completer;

  RazorpayAdapter(this.config) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _onError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _onExternalWallet);
  }

  @override
  Future<PaymentResult> charge(PaymentOptions options) {
    _completer = Completer<PaymentResult>();

    _razorpay.open({
      'key': config.key,
      'amount': options.amount,
      'currency': options.currency,
      'name': config.name,
      'description': config.description,
      'image': config.image,
      'prefill': config.prefill,
      'notes': {...?config.notes, ...?options.metadata},
    });

    return _completer!.future;
  }

  void _onSuccess(PaymentSuccessResponse response) {
    _completer?.complete(
      PaymentResult.success(
        transactionId: response.paymentId ?? '',
        message: 'Payment successful',
        raw: response,
      ),
    );
  }

  void _onError(PaymentFailureResponse response) {
    _completer?.complete(
      PaymentResult.failed(message: response.message, raw: response),
    );
  }

  void _onExternalWallet(ExternalWalletResponse response) {
    _completer?.complete(
      PaymentResult.pending(
        message: 'External wallet selected: ${response.walletName}',
      ),
    );
  }

  void dispose() => _razorpay.clear();
}
