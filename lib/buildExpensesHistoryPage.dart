import 'package:firstflut/db_context.dart';
import 'package:firstflut/Expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildExpensesHistoryPage extends StatefulWidget {
  BuildExpensesHistoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BuildExpensesHistoryPageState createState() =>
      new _BuildExpensesHistoryPageState();
}

class _BuildExpensesHistoryPageState extends State<BuildExpensesHistoryPage> {
  DbContext _context;
  List<Expense> _expenses = new List<Expense>();
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");

  @override
  initState() {
    super.initState();
    _context = new DbContext();
    _context.readExpense().then((list) {
      setState(() {
        _expenses = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          children: _expenses.map((i) {
            return ListTile(
              title: Text(
                i.name,
                textScaleFactor: 3.0,
              ),
              subtitle: Text(
                  i.value.toString() + " MDL " + dateFormat.format(i.date)),
            );
            //}
          }).toList(),
        ),
      ),
    );
  }
}
