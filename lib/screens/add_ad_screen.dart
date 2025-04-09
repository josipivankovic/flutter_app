import 'package:flutter/material.dart';

class AddAdScreen extends StatefulWidget {
  final Function(Map<String, String>) onAddAd;

  const AddAdScreen({super.key, required this.onAddAd});

  @override
  State<AddAdScreen> createState() => _AddAdScreenState();
}

class _AddAdScreenState extends State<AddAdScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _saveAd() {
    if (_titleController.text.isEmpty || _priceController.text.isEmpty) return;

    final newAd = {
      'title': _titleController.text,
      'price': _priceController.text,
      'location': _locationController.text,
      'description': _descriptionController.text,
    };

    widget.onAddAd(newAd);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Oglas spremljen!'),
        content: Text(
          'Naslov: ${newAd['title']}\nCijena: ${newAd['price']} €\nLokacija: ${newAd['location']}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('U redu'),
          ),
        ],
      ),
    );

    _titleController.clear();
    _priceController.clear();
    _locationController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dodaj oglas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Naslov oglasa'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Cijena (€)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Lokacija'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Opis oglasa'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAd,
              child: const Text('Spremi oglas'),
            ),
          ],
        ),
      ),
    );
  }
}
