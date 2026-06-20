import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../features/cart/domain/entities/cart_item.dart';

class MidtransService {
  // CONFIGURATION
  // Note: Storing server key client-side is fine for local prototyping / frontend-only work,
  // but in production these APIs must be called from a secure backend server.
  static const String serverKey = 'SB-Mid-server-J18eE-YmKjXo9yVz2P3F8Lq4'; // Standard Sandbox Server Key
  static const String clientKey = 'SB-Mid-client-L2G7h9v1N3d5P6K8'; // Standard Sandbox Client Key
  static const String snapUrl = 'https://app.sandbox.midtrans.com/snap/v1/transactions';
  static const String apiBaseUrl = 'https://api.sandbox.midtrans.com/v2';

  static String get _authHeader {
    final String credential = '$serverKey:';
    return 'Basic ${base64Encode(utf8.encode(credential))}';
  }

  /// Create Snap Transaction Token and Redirect URL
  static Future<Map<String, dynamic>?> createSnapTransaction({
    required String orderId,
    required double totalAmount,
    required String customerName,
    required List<CartItem> items,
  }) async {
    try {
      final List<Map<String, dynamic>> itemDetails = items.map((item) {
        // Enforce maximum title length of 50 chars for Midtrans
        String title = item.product.title;
        if (title.length > 40) {
          title = '${title.substring(0, 37)}...';
        }
        return {
          'id': item.product.id,
          'price': item.product.price.toInt(),
          'quantity': item.quantity,
          'name': '$title (${item.selectedSize})',
        };
      }).toList();

      // Add shipping cost (fixed at Rp 15.000 in the app)
      itemDetails.add({
        'id': 'SHIPPING_FEE',
        'price': 15000,
        'quantity': 1,
        'name': 'Shipping Fee',
      });

      final Map<String, dynamic> body = {
        'transaction_details': {
          'order_id': orderId,
          'gross_amount': totalAmount.toInt(),
        },
        'item_details': itemDetails,
        'customer_details': {
          'first_name': customerName,
          'email': 'customer@example.com',
          'phone': '08123456789',
        },
        'credit_card': {
          'secure': true,
        },
      };

      final http.Response response = await http.post(
        Uri.parse(snapUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': _authHeader,
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return {
          'token': data['token'] as String,
          'redirect_url': data['redirect_url'] as String,
        };
      } else {
        debugPrint('[MidtransService] Error creating Snap transaction: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('[MidtransService] Create transaction exception: $e');
      return null;
    }
  }

  /// Get status of a transaction
  static Future<String?> checkPaymentStatus(String orderId) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$apiBaseUrl/$orderId/status'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': _authHeader,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['transaction_status'] as String?;
      } else {
        debugPrint('[MidtransService] Error checking status: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('[MidtransService] Check status exception: $e');
      return null;
    }
  }
}
