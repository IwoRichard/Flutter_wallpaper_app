import 'package:flutter/material.dart';
import 'package:wallpix/screens/pages/search_page.dart';

//Chip Decoration
const chipBorder = Color.fromRGBO(147, 149, 151, 0.5);
final chipDecoration = BoxDecoration(
    border: Border.all(color: chipBorder),
    borderRadius: BorderRadius.circular(20),
);

class choiceChip extends StatefulWidget {
  const choiceChip({Key? key}) : super(key: key);

  @override
  State<choiceChip> createState() => _choiceChipState();
}

class _choiceChipState extends State<choiceChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Luxury Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Luxury",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Entertainment Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Entertainment",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Abstract Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Abstract",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Nature Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Nature",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Sports Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Sports",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Technology Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Technology",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Colourful Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Colourful",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Drawings Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Drawings",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Flower Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Flower",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Art Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Art",style: TextStyle(color: Colors.black),),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> SearchPage(searchQuery: 'Animals Wallpaper')
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: chipDecoration,
            child: Text("Animals",style: TextStyle(color: Colors.black),),
          ),
        ),
      ],
    );
  }
}