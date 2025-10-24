import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              child: const Text('DN', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
          ),
          const SizedBox(height: 32),
          
          // Form Email
          const Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: 'admin1@gmail.com',
            decoration: const InputDecoration(hintText: 'Masukkan email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          // Form Nomor HP
          const Text('Nomor HP', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: '081234567890',
            decoration: const InputDecoration(hintText: 'Masukkan nomor HP'),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          
          // Form Password
          const Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: '********',
            obscureText: true, // Menyembunyikan teks password
            decoration: const InputDecoration(hintText: 'Masukkan password'),
          ),
          const SizedBox(height: 40),

          // Tombol Simpan
          ElevatedButton(
            onPressed: () {
              // Logika untuk menyimpan perubahan
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Save changes', style: TextStyle(fontSize: 16, color: Colors.white)),
          )
        ],
      ),
    );
  }
}