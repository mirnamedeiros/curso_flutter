import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  
  const TransactionList({ super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty 
      ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              'Nenhuma despesa cadastrada !',
              style: Theme.of(context).textTheme.headline6
            ),
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/no_data.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      )
      : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final t = transactions[index];
          return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'R\$ ${t.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple.shade200
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat(' d MMM y').format(t.date),
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}