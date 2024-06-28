import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static const String routeName = '/Search-screen';

  final _formkey = GlobalKey<FormState>();
  String _city = "";
  void submit(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Navigator.pop(context, _city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please city";
                    } else if (value.length < 3) {
                      return "Too short";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _city = newValue!;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter a city",
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      submit(context);
                    },
                    child: Text("Get weather")),
              ],
            ),
          )),
    );
  }
}
