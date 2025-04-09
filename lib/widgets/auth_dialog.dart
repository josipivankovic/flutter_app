import 'package:flutter/material.dart';

void showAuthDialog(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'Lozinka'),
            obscureText: true,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Zatvori'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Ovde možeš dodati fake login logiku
          },
          child: const Text('Potvrdi'),
        ),
      ],
    ),
  );
}
