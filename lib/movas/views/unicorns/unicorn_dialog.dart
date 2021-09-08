import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movas_demo_app/movas/actions/unicorns_action.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorn_observable.dart';

class UnicornDialog extends StatefulWidget {
  @override
  _UnicornDialogState createState() => _UnicornDialogState();
}

class _UnicornDialogState extends State<UnicornDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Unicorn"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            value: color,
            items: ["Blue", "Red", "Green", "Yellow"]
                .map((e) => DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                color = value;
              });
            },
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: _ageController,
            decoration: InputDecoration(labelText: "Age"),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            UnicornsA.of(context).createUnicorn(
              UnicornO(
                name: _nameController.text,
                age: int.tryParse(_ageController.text),
                color: color,
              ),
            );
          },
          child: Text("Create"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _ageController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
