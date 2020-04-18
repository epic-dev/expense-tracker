import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addFn;
  NewTransaction(this.addFn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addFn(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickerDate) {
      if (pickerDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickerDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 2)),
        height: 300,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(height: 5.0),
            TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(_selectedDate != null
                        ? DateFormat.yMd().format(_selectedDate)
                        : 'Date is not selected!')),
                FlatButton(
                  child: Text('Chose date'),
                  onPressed: _presentDatepicker,
                ),
              ],
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
