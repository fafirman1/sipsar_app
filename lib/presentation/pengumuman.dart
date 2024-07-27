import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sipsar/data/models/response/pengumuman_response_model.dart';
import 'package:sipsar/presentation/bloc/pengumuman/pengumuman_bloc.dart';

import '../constants/variables.dart';

class PengumumanPage extends StatelessWidget {
  const PengumumanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<PengumumanBloc, PengumumanState>(
          builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) {
            return Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          },
          success: (pengumuman) {
            return Container(
              width: screenWidth,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16.0),
              color: const Color.fromRGBO(47, 135, 109, 1),
              child: ListView.builder(
                itemCount: pengumuman.length,
                itemBuilder: (context, index) => PengumanCard(
                  data: pengumuman[index],
                ),
              ),
            );
          },
          orElse: () {
            return const SizedBox();
          },
        );
      }),
    );
  }
}

class PengumanCard extends StatelessWidget {
  final Pengumuman data;

  const PengumanCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String tanggal = formatter.format(data.createdAt);
    final String baseUrl = Variables.baseUrl;

    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.tittle,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                tanggal,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 55, 55, 55),
                ),
              ),
              const Divider(),
              Text(
                data.isi,
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.justify,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        data.tittle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tanggal,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 55, 55, 55),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Divider(),
                            Text(
                              data.isi,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            TextButton(
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: '${Variables.baseUrl}/storage/pengumuman/${data.lampiran}'));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Link disalin, silahkan tempel di browser untuk mengunduh')),
                                );
                              }, 
                              child: const Text(
                                'Unduh Lampiran',
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Selengkapnya >',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 11, 147, 81),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
