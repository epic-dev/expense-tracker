import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addFn;
  NewTransaction(this.addFn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text); 
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addFn(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 2)),
        height: 200,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: titleController,
              decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                  onSubmitted: (_) => submitData(),
            ),
            SizedBox(height: 5.0),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                  onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
