import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipsar/presentation/bloc/profile/profile_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/variables.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text("Initial State")),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (profile) => Container(
              width: screenWidth,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(47, 135, 109, 1),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: screenWidth,
                      height: 360,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            '${Variables.baseUrl}/storage/profile/${profile.image}'
                            ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromRGBO(47, 135, 109, 1),
                              Color.fromRGBO(0, 0, 0, 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 75),
                          Image.network(
                            '${Variables.baseUrl}/storage/profile/${profile.logo}',
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            profile.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: screenWidth - 40, // Subtracting padding
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sejarah',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(47, 135, 109, 1),
                                    ),
                                  ),
                                  const Divider(),
                                  Text(
                                    profile.sejarah,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Visi',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(47, 135, 109, 1),
                                    ),
                                  ),
                                  const Divider(),
                                  Text(
                                    profile.visi,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Misi',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(47, 135, 109, 1),
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Untuk mencapai visi tersebut, SMP IT Insan Qur’ani memiliki beberapa misi:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(profile.misi),
                                  const SizedBox(height: 20),
                                  Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _launchURL(profile.lokasi);
                                        },
                                        child: const Text('Lokasi'),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Handle error here
      throw 'Could not launch $url';
    }
  }
}
