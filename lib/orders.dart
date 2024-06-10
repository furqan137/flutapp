import 'package:flutter/material.dart';
import 'order_details_page.dart'; // Import the order details page

class OrderListItem extends StatelessWidget {
  final Map<String, String> order;
  final VoidCallback onTap;

  const OrderListItem({
    required this.order,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(order['orderNumber']!),
      onTap: onTap,
    );
  }
}

class ViewOrdersPage extends StatefulWidget {
  @override
  _ViewOrdersPageState createState() => _ViewOrdersPageState();
}

class _ViewOrdersPageState extends State<ViewOrdersPage> {
  List<Map<String, String>> _orders = [
    {
      'orderNumber': 'Summer Collection - Men',
      'orderDate': '2024-06-01',
      'orderPrice': '\$100',
    },
    {
      'orderNumber': 'Spring Fashion - Women',
      'orderDate': '2024-06-03',
      'orderPrice': '\$120',
    },
    {
      'orderNumber': 'Formal Attire - Office Wear',
      'orderDate': '2024-06-05',
      'orderPrice': '\$90',
    },
    {
      'orderNumber': 'Casual Outfit - Weekend Style',
      'orderDate': '2024-06-07',
      'orderPrice': '\$80',
    },
    {
      'orderNumber': 'Traditional Dress - Cultural Event',
      'orderDate': '2024-06-09',
      'orderPrice': '\$110',
    },
    {
      'orderNumber': 'Sports Apparel - Active Wear',
      'orderDate': '2024-06-11',
      'orderPrice': '\$95',
    },
    {
      'orderNumber': 'Evening Gown - Party Dress',
      'orderDate': '2024-06-13',
      'orderPrice': '\$150',
    },
    {
      'orderNumber': 'Wedding Ensemble - Bride',
      'orderDate': '2024-06-15',
      'orderPrice': '\$200',
    },
    {
      'orderNumber': 'Business Suit - Executive Wear',
      'orderDate': '2024-06-17',
      'orderPrice': '\$180',
    },
    {
      'orderNumber': 'Vintage Fashion - Retro Look',
      'orderDate': '2024-06-19',
      'orderPrice': '\$130',
    },
    // Add more orders as needed
  ];

  void _navigateToOrderDetails(BuildContext context, Map<String, String> order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsPage(
          orderNumber: order['orderNumber']!,
          orderDate: order['orderDate']!,
          orderPrice: order['orderPrice']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Orders'),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return OrderListItem(
            order: order,
            onTap: () => _navigateToOrderDetails(context, order),
          );
        },
      ),
    );
  }
}
