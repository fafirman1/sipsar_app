import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/rectangle_3.jpeg'),
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
                    Image.asset(
                      'assets/images/pngwing_com_31.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Profile Page',
                      style: TextStyle(
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
                            const Text(
                              'SMP IT Insan Qur’ani Poncowarno merupakan sekolah yang terletak di Jalan Raya Poncowarno, Gang IQ, Kecamatan Kalirejo, Kabupaten Lampung Tengah. SMP ini merupakan Sekolah Memenengah Pertama yang mengintegrasikan kurikulum umum dengan pendidikan agama Islam. Mereka fokus pada pengembangan akademis dan moral siswa dengan pendekatan holistik. Kurikulumnya mencakup mata pelajaran umum seperti matematika, ilmu pengetahuan, dan bahasa, sambil memberikan penekanan pada nilai-nilai Islam dan pembelajaran Al-Qur\'an sehingga fokusnya tidak hanya pada prestasi akademis saja tetapi juga pada pengembangan karakter dan moral siswa sesuai ajaran islam.',
                              style: TextStyle(
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
                            const Text(
                              'Terwujudnya generasi muslim yang kuat aqidah, taat ibadah, berakhlaq karimah, sehat jasmani, unggul dalam penguasaan ilmu pengetahuan dan teknologi serta mampu bersaing secara global.',
                              style: TextStyle(
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
                            const BulletList(
                              items: [
                                'Meningkatkan kualitas keimanan dan ketaqwaan kepada Allah SWT.',
                                'Menyelenggarakan pembelajaran dan bimbingan secara efektif.',
                                'Mengembangkan potensi akademik dan non-akademik peserta didik.',
                                'Menumbuhkan penghayatan terhadap ajaran agama Islam.',
                              ],
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Button action
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
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '• ',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: Text(
                item,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfilePage(),
  ));
}
