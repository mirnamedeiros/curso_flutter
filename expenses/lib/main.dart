
import 'dart:io';
import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeData myTheme = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: myTheme.copyWith(
        colorScheme: myTheme.colorScheme.copyWith(
          primary: Colors.deepPurple.shade200,
          secondary: Colors.deepPurple,
        ),
        textTheme: myTheme.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((t) {
      return t.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextInt(1000).toString(), 
      title: title, 
      value: value, 
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((t) => t.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text(
        'Despesas Pessoais',
      ),
      actions: [
        if(isLandscape)
          IconButton(
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            }, 
            icon: Icon(_showChart ? Icons.list : Icons.bar_chart),
          ),
        IconButton(
          onPressed: () => _openTransactionFormModal(context), 
          icon: Icon(Icons.add),
        ),
      ],
      backgroundColor: Colors.deepPurple.shade200,
      centerTitle: true,
    );
    final availableHeight = mediaQuery.size.height 
      - appBar.preferredSize.height 
      - mediaQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 0.8 : 0.3),
                child: Chart(
                  recentTransactions: _recentTransactions
                ),
              ),
            if(!_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 1 : 0.7),
                child: TransactionList(
                  transactions: _transactions, 
                  onRemove: _removeTransaction
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Platform.isIOS 
      ? Container()
      : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}