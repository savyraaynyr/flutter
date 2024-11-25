import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GaleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GalleryItem>>(
      future: fetchGalleryItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final item = snapshot.data![index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      item.imageUrl.isNotEmpty ? item.imageUrl : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnEBfLiTxZtU9sk5pGFy_noyN6Qjs7emYeUw&s/150',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://via.placeholder.com/150', // Placeholder image URL
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<List<GalleryItem>> fetchGalleryItems() async {
    final response = await http.get(Uri.parse('https://ujikom2024pplg.smkn4bogor.sch.id/0074950092/galery.php'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => GalleryItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load gallery items');
    }
  }
}

class GalleryItem {
  final String title;
  final String imageUrl;

  GalleryItem({required this.title, required this.imageUrl});

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      title: json['judul_info'] ?? 'Olahraga Pagi Peserta LDKS', // Fallback to 'No Title'
      imageUrl: json['image_url'] ?? '', // Fallback to an empty string
    );
  }
}