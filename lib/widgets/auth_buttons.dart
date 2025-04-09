import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: const Text('Ova funkcionalnost je trenutno nedostupna.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Zatvori'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => _showDialog(context, 'Prijava'),
          child: const Text('Prijava'),
        ),
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: () => _showDialog(context, 'Registracija'),
          child: const Text('Registracija'),
        ),
      ],
    );
  }
}
