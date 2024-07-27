import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArPage extends StatelessWidget {
  const ArPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _launchUnityApp();
        },
        child: const Text('Buka'),
      ),
    );
  }
}

Future<void> _launchUnityApp() async {
  const urlString = 'youtube://open'; // Replace with your actual custom URL scheme
  final url = Uri.parse(urlString);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $urlString';
  }
}
