import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/order_widget.dart';
import 'package:shop/providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<Orders>(context, listen: false).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshOrders(context),
        child: FutureBuilder(
          future: Provider.of<Orders>(context, listen: false).loadOrders(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              child:
              Center(
                child: Text('Ocorreu um erro!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orders, child) {
                  return ListView.builder(
                    itemCount: orders.items.length,
                    itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
