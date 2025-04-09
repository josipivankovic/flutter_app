import 'package:flutter/material.dart';

class AdsScreen extends StatelessWidget {
  final List<Map<String, String>> oglasi;
  final void Function(int) onDelete;
  final void Function(int, Map<String, String>) onEdit;

  const AdsScreen({
    super.key,
    required this.oglasi,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Svi oglasi')),
      body: ListView.builder(
        itemCount: oglasi.length,
        itemBuilder: (context, index) {
          final oglas = oglasi[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(oglas['title'] ?? ''),
              subtitle: Text('${oglas['price']} € - ${oglas['location']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      _showEditDialog(context, index, oglas);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onDelete(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index, Map<String, String> oglas) {
    final titleController = TextEditingController(text: oglas['title']);
    final priceController = TextEditingController(text: oglas['price']);
    final locationController = TextEditingController(text: oglas['location']);
    final descriptionController = TextEditingController(text: oglas['description']);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Uredi oglas'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Naslov')),
              TextField(controller: priceController, decoration: const InputDecoration(labelText: 'Cijena (€)')),
              TextField(controller: locationController, decoration: const InputDecoration(labelText: 'Lokacija')),
              TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Opis')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Odustani'),
          ),
          ElevatedButton(
            onPressed: () {
              final updated = {
                'title': titleController.text,
                'price': priceController.text,
                'location': locationController.text,
                'description': descriptionController.text,
              };
              onEdit(index, updated);
              Navigator.pop(context);
            },
            child: const Text('Spremi'),
          ),
        ],
      ),
    );
  }
}
