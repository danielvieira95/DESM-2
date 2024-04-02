import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Checkbox Exemplo'),
        ),
        body: Center(
          child: //CheckboxExample(),
          RadioButtonExample(),
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool _isChecked = false;
  bool _isChecked1=false;
 void _showMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Checkbox was pressed'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'CheckBox 1',
          style: TextStyle(fontSize: 20.0),
        ),
        //SizedBox(height: 20.0),
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        SizedBox(height: 10.0),
        Text(
          'Checkbox 1 foi selecionado: $_isChecked',
          style: TextStyle(fontSize: 16.0),
        ),
         Checkbox(
          value: _isChecked1,
          onChanged: (bool? value) {
            setState(() {
              _isChecked1 = value!;
              if(_isChecked1 == true){
                _showMessage();
              }
            });
          },
        ),
        SizedBox(height: 10.0),
        Text(
          'Checkbox1 foi selecionado: $_isChecked1',
          style: TextStyle(fontSize: 16.0),
        ),
       
      ],
    );
  }
}

class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Radio Button Exemplo',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 20.0),
        RadioListTile<String>(
          title: Text('Option 1'),
          value: 'Option 1',
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Option 2'),
          value: 'Option 2',
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Option 3'),
          value: 'Option 3',
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
        SizedBox(height: 10.0),
        Text(
          'Selected Option: $_selectedOption',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
