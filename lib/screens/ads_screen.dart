import 'package:flutter/material.dart';

class AdsScreen extends StatefulWidget {
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
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  String selectedCategory = 'Kategorije';

  final List<String> kategorije = ['Sve kategorije', 'Automobili', 'Motori', 'Dijelovi'];

  List<Map<String, String>> get filteredOglasi {
    if (selectedCategory == 'Kategorije' || selectedCategory == 'Sve kategorije') {
      return widget.oglasi;
    }
    return widget.oglasi.where((oglas) {
      return oglas['category']?.toLowerCase() == selectedCategory.toLowerCase();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Svi oglasi')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DropdownButton<String>(
              value: selectedCategory == 'Kategorije' ? null : selectedCategory,
              isExpanded: true,
              hint: const Text('Kategorije'),
              items: kategorije.map((kategorija) {
                return DropdownMenuItem(
                  value: kategorija,
                  child: Text(kategorija),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
          ),
          Expanded(
            child: filteredOglasi.isEmpty
                ? const Center(child: Text('Nema oglasa za odabranu kategoriju.'))
                : ListView.builder(
                    itemCount: filteredOglasi.length,
                    itemBuilder: (context, index) {
                      final oglas = filteredOglasi[index];
                      final originalIndex = widget.oglasi.indexOf(oglas);

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(oglas['title'] ?? ''),
                          subtitle: Text(
                              '${oglas['price']} € - ${oglas['location']}\nKategorija: ${oglas['category'] ?? 'Nepoznato'}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  _showEditDialog(context, originalIndex, oglas);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => widget.onDelete(originalIndex),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index, Map<String, String> oglas) {
    final titleController = TextEditingController(text: oglas['title']);
    final priceController = TextEditingController(text: oglas['price']);
    final locationController = TextEditingController(text: oglas['location']);
    final descriptionController = TextEditingController(text: oglas['description']);
    final categoryController = TextEditingController(text: oglas['category']);

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
              TextField(controller: categoryController, decoration: const InputDecoration(labelText: 'Kategorija')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Odustani')),
          ElevatedButton(
            onPressed: () {
              final updated = {
                'title': titleController.text,
                'price': priceController.text,
                'location': locationController.text,
                'description': descriptionController.text,
                'category': categoryController.text,
              };
              widget.onEdit(index, updated);
              Navigator.pop(context);
            },
            child: const Text('Spremi'),
          ),
        ],
      ),
    );
  }
}
