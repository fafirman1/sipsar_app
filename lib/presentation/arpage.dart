import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ArPage extends StatelessWidget {
  const ArPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Pastikan Anda Sudah Menginstall Aplikasi OverlyApp. Unduh Melalui Tombol Berikut, Kemudian arahkan kamera ke logo sekolah SMP IT Insan Qur"ani Poncowarno',
            style: TextStyle( fontSize: 14,fontWeight: FontWeight.w600,),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12,),
          ElevatedButton(
            onPressed: () {
                      Clipboard.setData(
                        const ClipboardData(text: 'https://play.google.com/store/apps/details?id=com.Overly.Cloud'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Link disalin, silahkan tempel di browser untuk mengunduh')),
                      );
                    },
            child: const Text('Buka'),
          ),
        ],
      ),
    );
  }
}
