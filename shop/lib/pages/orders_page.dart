import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(
              child: Text('An error occurred !'),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () => _refreshOrders(context),
              child: Consumer<OrderList>(
                builder: (ctx, orders, child) => ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (ctx, index) =>
                      OrderWidget(order: orders.items[index]),
                ),
              ),
            );
          }
        },
      ),
      // body: _isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     : RefreshIndicator(
      //         onRefresh: () => _refreshOrders(context),
      //         child: ListView.builder(
      //           itemCount: orders.itemsCount,
      //           itemBuilder: (ctx, index) =>
      //               OrderWidget(order: orders.items[index]),
      //         ),
      //       ),
    );
  }
}
