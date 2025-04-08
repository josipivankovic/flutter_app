import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Opis vozila:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'Moderan gradski automobil s električnim pogonom. '
          'U izvrsnom stanju, redovno održavan. Idealno za svakodnevnu vožnju.',
        ),
        const SizedBox(height: 20),
        const Text(
          'Tehnički podaci:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text('Godina: 2018'),
        const Text('Kilometraža: 143 000 km'),
        const Text('Gorivo: Električni'),
        const Text('Mjenjač: Automatski'),
        const Text('Snaga motora: 135 kW'),
        const SizedBox(height: 20),
        const Text(
          'Kontakt informacije:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text('Ime prodavača: Josip Josipović'),
        const Text('Telefon: +385 91/123-2233'),
        const Text('Lokacija: Zagreb'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Kontaktiraj prodavača'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    TextField(
                      decoration: InputDecoration(labelText: 'Vaše ime'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Vaša poruka'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Otkaži'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print('Poruka poslana');
                    },
                    child: const Text('Pošalji'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Kontaktiraj prodavača'),
        ),
      ],
    );
  }
}
