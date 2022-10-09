import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'pages/explore_page.dart';
import 'pages/home_page.dart';

const primary = Color.fromRGBO(90, 101, 195, 1);
const inactiveButton = Color.fromRGBO(147, 149, 151, 1);

class BottomNavMobile extends StatefulWidget {
  const BottomNavMobile({super.key});

  @override
  State<BottomNavMobile> createState() => _BottomNavMobileState();
}

class _BottomNavMobileState extends State<BottomNavMobile> {
  
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const ExplorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: [
          const HomePage(),
          const ExplorePage(),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        //elevation: 10,
          selectedItemColor: primary,
          unselectedItemColor: inactiveButton,
          iconSize: 19,
          selectedIconTheme: const IconThemeData(size: 22),
          selectedLabelStyle: GoogleFonts.montserrat(textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          unselectedLabelStyle: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 12)),
          onTap: (index) => setState(()=> currentIndex = index),
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Iconsax.home_15),
              icon: Icon(Iconsax.home),
              label: 'Home'
              ),
            BottomNavigationBarItem(
              activeIcon: Icon(Iconsax.filter5),
              icon: Icon(Iconsax.filter),
              label: 'Explore'
              ),  
          ],
          ),
    );
  }
}