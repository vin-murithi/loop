import 'package:flutter/material.dart';

class ReusableDialog {

  Future displayTextInputDialog(BuildContext context, controller,
      String title, String body, String inputHint) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title),
              content: TextField(
                onChanged: (value) {
                  //Use bloc
                },
                controller: controller,
                decoration: InputDecoration(hintText: inputHint),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context, controller.text);
                    }),
              ]);
        });
  }
}
