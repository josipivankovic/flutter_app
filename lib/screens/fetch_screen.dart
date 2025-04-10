import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  List<dynamic> cars = [];
  bool loading = false;

  Future<void> fetchCars() async {
    setState(() {
      loading = true;
    });

    final url = Uri.parse('https://67f7ccba2466325443eac6c6.mockapi.io/api/v1/cars');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          cars = json.decode(response.body);
        });
      } else {
        print('Greška: ${response.statusCode}');
      }
    } catch (e) {
      print('Greška pri fetchanju: $e');
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fetch podaci - Automobili")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: fetchCars,
              child: const Text("Dohvati automobile"),
            ),
            const SizedBox(height: 16),
            loading
                ? const Center(child: CircularProgressIndicator())
                : cars.isEmpty
                    ? const Text("Nema podataka. Klikni dugme da dohvatiš.")
                    : Expanded(
                        child: ListView.builder(
                          itemCount: cars.length,
                          itemBuilder: (context, index) {
                            final car = cars[index];
                            return ListTile(
                              leading: CircleAvatar(child: Text(car['id'])),
                              title: Text(car['title']),
                              subtitle: Text('${car['price']} - ${car['location']}'),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
