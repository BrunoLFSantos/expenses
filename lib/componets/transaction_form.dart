import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
    final title = titleController.text;
    final value = double.parse(valueController.text);
    if(title.isEmpty || value <=0){
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      onSubmitted: (_) => _submitForm(),
                      decoration: InputDecoration(
                        labelText: 'Título'
                      ),
                    ),
                    TextField(
                      controller: valueController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => _submitForm(),
                      decoration: InputDecoration(
                        labelText: 'Valor (R\$)'
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: _submitForm,
                          child: Text('Nova Transação', 
                            style: TextStyle(
                              color: Colors.purple
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }
}