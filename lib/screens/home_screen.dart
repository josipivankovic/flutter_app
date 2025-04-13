import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/car_details.dart';
import '../widgets/image_gallery.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, String>> oglasi;

  const HomeScreen({super.key, required this.oglasi});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';
  String selectedCategory = 'Sve kategorije';

  List<String> kategorije = ['Sve kategorije', 'Automobili', 'Motori', 'Dijelovi'];

  List<Map<String, String>> get filteredOglasi {
    return widget.oglasi.where((oglas) {
      final titleMatch = oglas['title']!.toLowerCase().contains(query.toLowerCase());
      final categoryMatch = selectedCategory == 'Sve kategorije' ||
          (oglas['category']?.toLowerCase() == selectedCategory.toLowerCase());
      return titleMatch && categoryMatch;
    }).toList();
  }

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Prijava"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Lozinka'), obscureText: true),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Otkaži')),
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
            TextField(decoration: InputDecoration(labelText: 'Ime')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Lozinka'), obscureText: true),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Otkaži')),
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
              onSearch: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                items: kategorije
                    .map((kategorija) => DropdownMenuItem(
                          value: kategorija,
                          child: Text(kategorija),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                oglas['title']!,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              oglas['price']!,
              style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
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
            if (filteredOglasi.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Divider(),
              const Text(
                '🆕 Novi oglasi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...filteredOglasi.map((oglas) => Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    elevation: 3,
                    child: ListTile(
                      title: Text(oglas['title'] ?? ''),
                      subtitle: Text(
                          'Cijena: ${oglas['price']} €\nLokacija: ${oglas['location']}\nKategorija: ${oglas['category'] ?? 'Nepoznato'}'),
                    ),
                  ))
            ] else ...[
              const SizedBox(height: 20),
              const Text('Nema rezultata za traženi pojam.'),
            ],
          ],
        ),
      ),
    );
  }
}