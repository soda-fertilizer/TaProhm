import 'package:flutter/material.dart';

Future noInternet(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: const Text('Error!'),
        content: const Text('Please check you internet connection!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
