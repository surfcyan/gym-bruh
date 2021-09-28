import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({Key? key}) : super(key: key);

  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  // Form Key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 300,
      child: Column(
        children: [
          // HEading
          Text(
            'Add New Exercise',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          // Sized Box
          SizedBox(height: 36),
          // Form
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Textfield
                TextFormField(
                  // autofillHints: ['Chest Press', 'Dumbell Press'],
                  decoration: new InputDecoration(
                    // border: InputBorder.none,
                    hintText: 'Exercise Name',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),

                // Sized Box
                SizedBox(height: 24),
                // Button
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Add Exercise'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
