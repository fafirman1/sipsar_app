
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipsar/data/datasource/guru_remote_datasource.dart';
import 'package:sipsar/data/datasource/profile_remote_datasource.dart';
import 'package:sipsar/presentation/bloc/guru/guru_bloc.dart';
import 'package:sipsar/presentation/bloc/profile/profile_bloc.dart';

import 'presentation/event.dart';
import 'presentation/guru.dart';
import 'presentation/pengumuman.dart';
import 'presentation/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(ProfileRemoteDatasource())
          ..add(const ProfileEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => GuruBloc(GuruRemoteDatasource())
          ..add(const GuruEvent.fetch())
          ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: MyHomePage()   
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ProfilePage(),
    const GuruPage(),
    const PengumumanPage(),
    const EventsPage(),
    const Scaffold()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Warna shadow
              spreadRadius: 5, // Jangkauan shadow
              blurRadius: 10, // Blur radius shadow
              offset: const Offset(0, 3), // Posisi shadow
            ),
          ],
        ),
        child: ClipRRect(
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Guru',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.announcement),
                label: 'Anno',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Event',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.videocam),
                label: 'AR',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color(0xff30876D),
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}


