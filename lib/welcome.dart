import 'package:flutter/material.dart';
import 'home.dart';
import 'info.dart';
import 'agenda.dart';
import 'galery.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    InfoScreen(),
    AgendaScreen(),
    GaleryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student App',
          style: TextStyle(
            color: Color.fromARGB(255, 246, 246, 248), // Warna teks
            fontWeight: FontWeight.bold, // Memberikan gaya tebal pada teks
            fontSize: 24, // Ukuran teks
          ),
        ),
        centerTitle: true, // Untuk memusatkan teks judul
        backgroundColor: Color(0xFF2196F3), // Warna biru yang lebih cerah
        elevation: 4, // Memberikan bayangan pada AppBar
        shadowColor: Colors.black.withOpacity(0.5), // Warna bayangan
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          const BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Agenda',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Galery',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF1976D2), // Warna biru tua saat item terpilih
        unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}

mixin agenda {
}
