import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'screens/home_screen.dart';
import 'screens/ads_screen.dart';
import 'screens/add_ad_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autooglasnik',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Map<String, String>> _oglasi = [];

  Future<void> _ucitajOglase() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('oglasi');
    if (data != null) {
      setState(() {
        _oglasi = (json.decode(data) as List)
            .map((e) => Map<String, String>.from(e))
            .toList();
      });
    }
  }

  Future<void> _spremiOglase() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('oglasi', json.encode(_oglasi));
  }

  @override
  void initState() {
    super.initState();
    _ucitajOglase();
  }

  void _dodajOglas(Map<String, String> oglas) {
    setState(() {
      _oglasi.add(oglas);
    });
    _spremiOglase();
  }

  void _urediOglas(int index, Map<String, String> noviPodaci) {
    setState(() {
      _oglasi[index] = noviPodaci;
    });
    _spremiOglase();
  }

  void _obrisiOglas(int index) {
    setState(() {
      _oglasi.removeAt(index);
    });
    _spremiOglase();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(oglasi: _oglasi),
      AdsScreen(
        oglasi: _oglasi,
        onEdit: _urediOglas,
        onDelete: _obrisiOglas,
      ),
      AddAdScreen(onAddAd: _dodajOglas),
      const ContactScreen(),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Početna'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Oglasi'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Dodaj oglas'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Kontakt'),
        ],
      ),
    );
  }
}
