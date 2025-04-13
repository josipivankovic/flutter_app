import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;
  final Function(String) onSearch;

  const Header({
    super.key,
    required this.onLoginTap,
    required this.onRegisterTap,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Container(
      color: Colors.blue[800],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Autooglasnik',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: onLoginTap,
                    child: const Text('Prijava', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: onRegisterTap,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text('Registracija', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Pretraži oglase...',
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  onSearch(searchController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                ),
                child: const Text('Pretraži'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
