import './EarningsPage.dart';
import './ExpensesPage.dart';
import 'package:flutter/material.dart';
class Modal{
 
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, 'Add Income', Icons.monetization_on, _action1),
              _createTile(context, 'Add Expenses', Icons.money_off, _action2),
              _createTile(context, 'View Graphs', Icons.data_usage, _action3),
            ],
          );
        }
    );
  }

  ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
       action(context);
      },
    );
  }

  _action1(BuildContext context){
     Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (c)=> EarningsPage(title: "Add Income")));
  }

  _action2(BuildContext context){
     Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ExpensesPage(title: "Add Expense")));
  }

  _action3(BuildContext context){
    print('action 3');
  }
}