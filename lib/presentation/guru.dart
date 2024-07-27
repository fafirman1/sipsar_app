import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:sipsar/presentation/bloc/guru/guru_bloc.dart';

import '../constants/variables.dart';
import '../data/models/response/guru_response_model.dart';

class GuruPage extends StatelessWidget {
  const GuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<GuruBloc, GuruState>(builder: (context, state) {
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
          success: (guru) {
            return Container(
              width: screenWidth,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16.0),
              color: const Color.fromRGBO(47, 135, 109, 1),
              child: ListView.builder(
                itemCount: guru.length,
                itemBuilder: (context, index) => GuruCard(
                  data: guru[index],
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

class GuruCard extends StatelessWidget {
  final Guru data;

  const GuruCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Format the birthdate
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formattedDate = formatter.format(data.tanggalLahir);

    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      '${Variables.baseUrl}/storage/guru/${data.foto}',
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.nama,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Divider(),
                        Text(
                          'NIP : ${data.nip}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Table(
                  columnWidths: const {
                    0: IntrinsicColumnWidth(),
                    1: FixedColumnWidth(10),
                    2: FlexColumnWidth(),
                  },
                  children: [
                    TableRow(children: [
                      const Text(
                        'Telp.',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        ' : ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        data.telp,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        'e-Mail',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        ' : ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        data.email,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        'TL',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        ' : ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        'Alamat',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        ' : ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        data.alamat,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
