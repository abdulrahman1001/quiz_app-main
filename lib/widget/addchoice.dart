import 'package:flutter/material.dart';

class AddChoiceForm extends StatefulWidget {
  const AddChoiceForm({Key? key, required this.onssaved}) : super(key: key);

  final void Function(String, bool) onssaved;

  @override
  State<AddChoiceForm> createState() => _AddChoiceFormState();
}

class _AddChoiceFormState extends State<AddChoiceForm> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            state = !state;
            widget.onssaved('', state); // Pass the state value to the onChanged callback
          });
        },
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: state
                ? Icon(Icons.check, color: Colors.green)
                : Icon(Icons.close, color: Colors.red),
            border: OutlineInputBorder(),
            hintText: 'Add choice',
          ),
          maxLines: 1,
          onSaved: (value) {
            widget.onssaved(value!, state); // Pass the state value to the onChanged callback
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
    );
  }
}
