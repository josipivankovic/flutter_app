import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final String title;
  final String description;
  final String year;
  final String mileage;
  final String fuel;
  final String gearbox;
  final String power;
  final String seller;
  final String phone;
  final String location;

  const CarDetails({
    super.key,
    required this.title,
    required this.description,
    required this.year,
    required this.mileage,
    required this.fuel,
    required this.gearbox,
    required this.power,
    required this.seller,
    required this.phone,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Opis vozila:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(description),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tehnički podaci:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Godina: $year'),
                Text('Kilometraža: $mileage'),
                Text('Gorivo: $fuel'),
                Text('Mjenjač: $gearbox'),
                Text('Snaga motora: $power'),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Kontakt informacije:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Ime prodavača: $seller'),
                Text('Telefon: $phone'),
                Text('Lokacija: $location'),
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
            ),
          ),
        ),
      ],
    );
  }
}