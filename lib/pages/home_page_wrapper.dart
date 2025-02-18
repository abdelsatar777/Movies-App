import 'package:flutter/material.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/movies_screen.dart';
import '../presentation/screens/profile_screen.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  int _currentIndex = 0; // لتحديد الصفحة الحالية

  // قائمة الصفحات التي يمكن التنقل بينها
  final List<Widget> _pages = [
    HomeScreen(),
    MoviesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // عرض الصفحة المحددة
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.blueGrey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          iconSize: 35,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.slow_motion_video),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
