import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Praktikum 2',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LayoutScreen(), 
    );
  }
}

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vertical & Horizontal Layout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const Text(
              'Ini Text di Layout Vertical (Column)',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 100,
              color: Colors.green,
              child: const Center(child: Text('Ini Container')),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: const [
                Icon(Icons.star, size: 50, color: Colors.yellow),
                Icon(Icons.favorite, size: 50, color: Colors.red),
                Icon(Icons.thumb_up, size: 50, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: const Text('Lihat Profile'),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/Unand.png'), 
              backgroundColor: Colors.grey, 
            ),
            const SizedBox(height: 20),
            const Text(
              'Nama: Stanley Leonard Darmali',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blue[100],
              child: const Text('NIM: 231153021'),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 10),
                Text('Alamat: Jl. KIS Mangunsarkoro, Padang'),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 10),
                Text('Nomor Handphone: +628116660129'),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Jurusan: Informatika'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Logo_Unand.svg/600px-Logo_Unand.svg.png',
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}