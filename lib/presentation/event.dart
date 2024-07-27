import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sipsar/data/models/response/event_response_model.dart';
import 'package:sipsar/presentation/bloc/acara/acara_bloc.dart';

import '../constants/variables.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<AcaraBloc, AcaraState>(
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
              success: (acara) {
                return Container(
                  width: screenWidth,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(16.0),
                  color: const Color.fromRGBO(47, 135, 109, 1),
                  child: ListView.builder(
                    itemCount: acara.length,
                    itemBuilder: (context, index) => AcaraCard(
                      data: acara[index],
                    ),
                  ),
                );
              },
              orElse: () {
                return const SizedBox();
              });
        },
      ),
    );
  }
}

class AcaraCard extends StatelessWidget {
  final Event data;

  const AcaraCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Format the date
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formattedDate = formatter.format(data.createdAt);

    return SizedBox(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '${Variables.baseUrl}/storage/event/${data.foto}',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.tittle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Divider(),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          data.content,
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _showEventDetail(context, data),
                  child: const Text('Selengkapnya'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEventDetail(BuildContext context, Event data) {
    showDialog(
      context: context,
      builder: (context) {
        final DateFormat formatter = DateFormat('dd MMM yyyy');
        final String formattedDate = formatter.format(data.createdAt);

        return AlertDialog(
          title: Text(
            data.tittle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '${Variables.baseUrl}/storage/event/${data.foto}',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  data.content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 10, color: Colors.black87),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
