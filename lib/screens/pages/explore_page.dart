import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpix/widgets/chips.dart';
import 'package:wallpix/widgets/popular_list.dart';
import '../bottom_nav.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  //For search
  TextEditingController searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8,right: 8,left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      'Explore',
                      style: GoogleFonts.montserrat(textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 19,color:primary)),
                    ),
                    const SizedBox(height: 10,),
                    const choiceChip(),
                    const SizedBox(height: 10,),
                    Text(
                      'Popular',
                      style: GoogleFonts.montserrat(textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 19,color:primary)),
                    ),
                    const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                    child:PopularList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
