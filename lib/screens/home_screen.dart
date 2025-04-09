import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/car_details.dart';
import '../widgets/image_gallery.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> oglasi;

  const HomeScreen({super.key, required this.oglasi});

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Prijava"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Lozinka'),
              obscureText: true,
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
              print('Prijavljen korisnik');
            },
            child: const Text('Prijava'),
          ),
        ],
      ),
    );
  }

  void _showRegisterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Registracija"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TextField(
              decoration: InputDecoration(labelText: 'Ime'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Lozinka'),
              obscureText: true,
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
              print('Korisnik registriran');
            },
            child: const Text('Registracija'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final oglas = {
      'title': 'Mini Cooper SE Seven',
      'price': '14.900 €',
      'location': 'Zagreb',
      'description':
          'Moderan gradski automobil s električnim pogonom. U izvrsnom stanju, redovno održavan. Idealno za svakodnevnu vožnju.',
      'year': '2018',
      'mileage': '143 000 km',
      'fuel': 'Električni',
      'gearbox': 'Automatski',
      'power': '135 kW',
      'seller': 'Josip Josipović',
      'phone': '+385 91/123-2233',
    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              onLoginTap: () => _showLoginDialog(context),
              onRegisterTap: () => _showRegisterDialog(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                oglas['title']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              oglas['price']!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const ImageGallery(),
            CarDetails(
              title: oglas['title']!,
              description: oglas['description']!,
              year: oglas['year']!,
              mileage: oglas['mileage']!,
              fuel: oglas['fuel']!,
              gearbox: oglas['gearbox']!,
              power: oglas['power']!,
              seller: oglas['seller']!,
              phone: oglas['phone']!,
              location: oglas['location']!,
            ),
            if (oglasi.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Divider(),
              const Text(
                '🆕 Novi oglasi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...oglasi.map((oglas) => ListTile(
                    title: Text(oglas['title'] ?? ''),
                    subtitle: Text(
                        'Cijena: ${oglas['price']} €\nLokacija: ${oglas['location']}'),
                  ))
            ],
          ],
        ),
      ),
    );
  }
}
