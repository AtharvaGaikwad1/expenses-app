import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction_list.dart';
import './models/transactions.dart';
import './models/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " GrossApp",
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.cyan,
          fontFamily: "Stick"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    //Transaction(
    // id: "t1",
    // title: "new shoes",
    // amount: 69.8,
    // date: DateTime.now(),
    //),
    // Transaction(
    //  id: "t2",

    //  amount: 16.53,
  ];
  List<Transaction> get _recentTransactions {
    return _userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txtitle, double txamount) {
    final newTX = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTX);
    });
  }

  void _startAddNEwTreansaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Gross App'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            hoverColor: Colors.blue,
            iconSize: 25,
            color: Colors.pink,
            onPressed: () => _startAddNEwTreansaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransaction)
          ],
        ), 
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startAddNEwTreansaction(context),
        label: Text('ADD Transaction'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
