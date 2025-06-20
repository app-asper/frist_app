import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  void _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+92 306-45 44 717');
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'aneesahmad09@gamil.com',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mobile Number',
              style: TextStyle(color: Colors.green),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('+92 306-45 44 717'),
              onTap: _launchPhone,
            ),
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(color: Colors.green),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('aneesahmad09@gamil.com'),
              onTap: _launchEmail,
            ),
          ],
        ),
      ),
    );
  }
}
