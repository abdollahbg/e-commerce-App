import 'package:ecommerce_app/models/Order.dart';
import 'package:flutter/material.dart';

class OrderproductsScreen extends StatelessWidget {
  final Order order;

  const OrderproductsScreen({super.key, required this.order});

  static void show(BuildContext context, Order order) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => OrderproductsScreen(order: order)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: Text(
          "Order #${order.id}",
          style: TextStyle(
            color: Colors.indigo.shade900,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo.shade800,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.indigo.shade800),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: Colors.indigo.shade700),
            onPressed: () {
              // Share order details
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert_rounded, color: Colors.indigo.shade700),
            onPressed: () {
              // Show more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Order Summary Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.indigo.shade100, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${order.products.length} items',
                      style: TextStyle(
                        color: Colors.indigo.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.indigo.shade200),
                  ),
                  child: Text(
                    'Delivered', // Replace with actual status
                    style: TextStyle(
                      color: Colors.indigo.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Products List
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: order.products.length,
                itemBuilder: (context, index) {
                  final product = order.products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      leading: Image.network(product.imageUrl),
                      title: Text(
                        product.title,
                        style: TextStyle(
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.indigo.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'Qty: ${product.ItemCount}',
                                  style: TextStyle(
                                    color: Colors.indigo.shade800,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${product.price.toStringAsFixed(2)} each',
                            style: TextStyle(
                              color: Colors.indigo.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${(product.price * product.ItemCount).toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.indigo.shade900,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.indigo.shade600,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: Colors.indigo.shade100,
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  );
                },
              ),
            ),
          ),

          // Total Price Card and Final Divider
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.indigo.shade100, width: 1),
            ),
            child: Column(
              children: [
                // Final Divider on top of total section
                Divider(
                  color: Colors.indigo.shade200,
                  thickness: 1,
                  height: 20,
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        color: Colors.indigo.shade700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      _calculateSubtotal(order),
                      style: TextStyle(
                        color: Colors.indigo.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(
                        color: Colors.indigo.shade700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\$5.99', // Replace with actual shipping cost
                      style: TextStyle(
                        color: Colors.indigo.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: TextStyle(
                        color: Colors.indigo.shade700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\$${(_calculateSubtotalAmount(order) * 0.08).toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.indigo.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Final Divider before total
                Divider(color: Colors.indigo.shade200, thickness: 1),

                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _calculateTotal(order),
                      style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom Action Buttons
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Reorder functionality
                    },
                    icon: Icon(
                      Icons.replay_rounded,
                      color: Colors.indigo.shade700,
                    ),
                    label: Text(
                      'Reorder',
                      style: TextStyle(
                        color: Colors.indigo.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(
                        color: Colors.indigo.shade300,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Contact support or track order
                    },
                    icon: const Icon(Icons.support_agent_outlined),
                    label: const Text(
                      'Help',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _calculateSubtotal(Order order) {
    double subtotal = 0;
    for (var product in order.products) {
      subtotal += product.price * product.ItemCount;
    }
    return '\$${subtotal.toStringAsFixed(2)}';
  }

  double _calculateSubtotalAmount(Order order) {
    double subtotal = 0;
    for (var product in order.products) {
      subtotal += product.price * product.ItemCount;
    }
    return subtotal;
  }

  String _calculateTotal(Order order) {
    double subtotal = _calculateSubtotalAmount(order);
    double shipping = 5.99; // Replace with actual shipping
    double tax = subtotal * 0.08; // 8% tax
    double total = subtotal + shipping + tax;
    return '\$${total.toStringAsFixed(2)}';
  }
}

// Alternative minimal version with just the divider fix
class OrderproductsScreenSimple extends StatelessWidget {
  final Order order;

  const OrderproductsScreenSimple({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order #${order.id} Products")),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: order.products.length,
              itemBuilder: (context, index) {
                final product = order.products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.title),
                  subtitle: Text("Quantity: ${product.ItemCount}"),
                  trailing: Text(
                    "\$${(product.price * product.ItemCount).toStringAsFixed(2)}",
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.grey.shade300, height: 1);
              },
            ),
          ),

          // Final divider at the end
          Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
        ],
      ),
    );
  }
}
