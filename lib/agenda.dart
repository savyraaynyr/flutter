import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  final List<Map<String, String>> agendaItems = [
    {'date': '19 Sep 2024', 'event': 'Maulid Nabi'},
    {'date': '26 sep 2024', 'event': 'Pensi'},
    {'date': '16-17 okt 2024', 'event': 'TransforKrab'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda Kegiatan'),
        backgroundColor: Color(0xFF64B5F6), // Warna biru lembut
      ),
      body: Container(
        color: Color(0xFFBBDEFB).withOpacity(0.3), // Background biru tipis dengan transparansi
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agenda Terdekat:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2), // Warna teks biru yang sedikit lebih gelap
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: agendaItems.length,
                itemBuilder: (context, index) {
                  final item = agendaItems[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.event,
                        color: Color(0xFF1976D2), // Ikon dengan warna biru yang serasi
                        size: 40,
                      ),
                      title: Text(
                        item['event']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1976D2), // Warna teks biru
                        ),
                      ),
                      subtitle: Text(
                        item['date']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Tambahkan aksi di sini
                },
                icon: Icon(Icons.add),
                label: Text('Tambah Agenda'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF64B5F6), // Warna biru lembut untuk tombol
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
