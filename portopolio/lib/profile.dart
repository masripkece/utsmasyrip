import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    Widget infoRow(IconData icon, String label, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: Colors.redAccent, size: 20),
            const SizedBox(width: 10),
            Text(
              '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child: Text(value)),
          ],
        ),
      );
    }

    Widget bulletRow(IconData icon, String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(icon, color: Colors.redAccent, size: 18),
            const SizedBox(width: 8),
            Expanded(child: Text(text)),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              args?['nama'] ?? 'Masyrip Hidayatullah',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Center(child: Text('NPM: ${args?['npm'] ?? '221002xxx'}')),
          Center(
            child: Text('Email: ${args?['email'] ?? 'masyrip@contoh.com'}'),
          ),

          const SizedBox(height: 16),
          const Divider(color: Colors.white24),
          const SizedBox(height: 12),

          const Text(
            'mau sombong dulu ye',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          infoRow(Icons.school, 'Prodi', 'Informatika'),
          infoRow(Icons.calendar_today, 'Semester', '5'),

          const SizedBox(height: 16),
          const Text(
            'Prestasi di Kampus:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          bulletRow(Icons.star, 'Juara 2 pupika upgris'),
          bulletRow(Icons.star, 'juara 1 basket ball brebes'),
          bulletRow(Icons.star, 'juara 1 video tiktik upgris'),

          const SizedBox(height: 16),
          const Text(
            'Pengalaman Organisasi:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          bulletRow(Icons.group, 'ketua bidang sumber daya manusia himforma'),
          bulletRow(Icons.group, 'ketua osis sma'),

          const SizedBox(height: 16),
          const Text(
            'mau pamer dulu:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return Image.asset(
                'assets/images/foto${index + 1}.jpg',
                fit: BoxFit.cover,
              );
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Dashboard'),
            ),
          ),
        ],
      ),
    );
  }
}
