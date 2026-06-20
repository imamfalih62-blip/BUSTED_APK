import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MidtransPaymentPage extends StatefulWidget {
  final String paymentUrl;
  final String orderId;

  const MidtransPaymentPage({
    super.key,
    required this.paymentUrl,
    required this.orderId,
  });

  @override
  State<MidtransPaymentPage> createState() => _MidtransPaymentPageState();
}

class _MidtransPaymentPageState extends State<MidtransPaymentPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading progress if needed
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('[MidtransPaymentPage] WebView error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            final String url = request.url.toLowerCase();
            debugPrint('[MidtransPaymentPage] Navigation to: $url');

            // Success redirect signatures from Midtrans
            if (url.contains('status_code=200') ||
                url.contains('transaction_status=settlement') ||
                url.contains('payment/finish') ||
                url.contains('payment-finish') ||
                url.contains('success')) {
              debugPrint('[MidtransPaymentPage] Payment success detected via redirect');
              Navigator.pop(context, 'success');
              return NavigationDecision.prevent;
            }

            // Cancel / Fail redirect signatures
            if (url.contains('payment/error') ||
                url.contains('error') ||
                url.contains('cancel') ||
                url.contains('failure')) {
              debugPrint('[MidtransPaymentPage] Payment cancellation/error detected via redirect');
              Navigator.pop(context, 'cancelled');
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SECURE PAYMENT',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Show confirmation dialog before closing the payment screen
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: const BeveledRectangleBorder(
                  side: BorderSide(color: Colors.orange, width: 2),
                ),
                title: const Text('CANCEL PAYMENT', style: TextStyle(fontWeight: FontWeight.w900)),
                content: const Text('Are you sure you want to leave the payment page? The order status will remain Pending.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('NO', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                      Navigator.pop(context, 'cancelled'); // Return cancelled status
                    },
                    child: const Text('YES, EXIT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: cs.surface,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                color: cs.primary,
                backgroundColor: cs.surface,
              ),
            ),
        ],
      ),
    );
  }
}
