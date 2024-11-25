import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with Blue Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1976D2), // Warna biru tua di bagian atas
                  Color(0xFF90CAF9), // Warna biru lembut di bagian bawah
                ],
              ),
            ),
          ),
          
          // Content in the Center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Home Icon
                Icon(
                  Icons.home,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                
                // Main Title
                Text(
                  'Welcome Home!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                
                // Subtitle Text
                Text(
                  'Explore and enjoy your experience.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
