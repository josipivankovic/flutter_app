import 'package:flutter/material.dart';
import '../widgets/car_details.dart';
import '../widgets/header.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> oglasi;

  const HomeScreen({super.key, this.oglasi = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(
              onLoginTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Prijava'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(decoration: InputDecoration(labelText: 'Email')),
                        TextField(decoration: InputDecoration(labelText: 'Lozinka'), obscureText: true),
                      ],
                    ),
                  ),
                );
              },
              onRegisterTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Registracija'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(decoration: InputDecoration(labelText: 'Ime')),
                        TextField(decoration: InputDecoration(labelText: 'Email')),
                        TextField(decoration: InputDecoration(labelText: 'Lozinka'), obscureText: true),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                hintText: 'Pretraži oglase...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Mini Cooper SE Seven',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              '14.900 €',
              style: TextStyle(fontSize: 22, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/mini.jpg', height: 220),
            ),

            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha((0.2 * 255).toInt()),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const CarDetails(),
            ),

            const SizedBox(height: 40),

            if (oglasi.isNotEmpty) ...[
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              const Text(
                '📢 Novi oglasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var oglas in oglasi.reversed)
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(oglas['title'] ?? ''),
                    subtitle: Text(
                      'Cijena: ${oglas['price']} €\nLokacija: ${oglas['location']}',
                    ),
                  ),
                ),
            ],

            const SizedBox(height: 20),
            const Text(
              '© Autooglasnik 2025',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
