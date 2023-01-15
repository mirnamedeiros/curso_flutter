import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function(String) onRemove;
  
  const TransactionList({ super.key, required this.transactions, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 395,
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
            elevation: 3,
            margin: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 20
            ),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  border: Border.all(
                    width: 2,
                    color: Colors.deepPurple.shade200,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                width: 100,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'R\$ ${t.value.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                t.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                DateFormat('d MMMM y').format(t.date),
              ),
              trailing: IconButton(
                onPressed: () => onRemove(t.id), 
                color: Colors.red.shade300,
                icon: Icon(
                  Icons.delete
                )
              ),
            ),
          );
        },
      ),
    );
  }
}