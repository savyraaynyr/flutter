import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi'),
        centerTitle: true,
        backgroundColor: Color(0xFF64B5F6), // Warna biru lembut
      ),
      body: Container(
        color: Color(0xFFBBDEFB)
            .withOpacity(0.3), // Background biru tipis dengan transparansi
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Sample Info Cards
            InfoCard(
              title: 'Sekolah Ramah Anak, Kepala sekolah bersama siswi teknik Komputer dan Jaringan',
              description:
                  'Sekolah ramah anak, kepala sekolah berbaur dengan siswa berdampak pada peningkatkan keterlibatan siswa dalam pembelajaran ',
              icon: Icons.new_releases,
            ),
            SizedBox(height: 16),
            InfoCard(
              title: 'Upacara Penyambutan Kunjungan Siswa Malaysia',
              description: 'Penyambutan siswa malaysia',
              icon: Icons.event,
            ),
            SizedBox(height: 16),
            InfoCard(
              title: 'Pemilihan Ketua Osis',
              description:
                  'SMKN 4 sedang mengadakan pemilihan osis tahun 2024/2025 ',
              icon: Icons.contact_phone,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const InfoCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Color(0xFF64B5F6), // Ikon dengan warna biru lembut
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Warna teks
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
