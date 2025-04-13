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

  String? _selectedCategory;

  final List<String> _kategorije = ['Automobili', 'Motocikli', 'Dijelovi', 'Ostalo'];

  void _saveAd() {
    if (_titleController.text.isEmpty || _priceController.text.isEmpty || _selectedCategory == null) return;

    final newAd = {
      'title': _titleController.text,
      'price': _priceController.text,
      'location': _locationController.text,
      'description': _descriptionController.text,
      'category': _selectedCategory!,
    };

    widget.onAddAd(newAd);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Oglas spremljen!'),
        content: Text(
          'Naslov: ${newAd['title']}\nCijena: ${newAd['price']} €\nLokacija: ${newAd['location']}\nKategorija: ${newAd['category']}',
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
    setState(() {
      _selectedCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dodaj oglas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Kategorija'),
                value: _selectedCategory,
                items: _kategorije.map((kategorija) {
                  return DropdownMenuItem(
                    value: kategorija,
                    child: Text(kategorija),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveAd,
                child: const Text('Spremi oglas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
