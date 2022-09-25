import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpix/screens/bottom_nav.dart';

class PictureViewPage extends StatefulWidget {
  final String pictureUrl;
  const PictureViewPage({
    Key? key,
    required this.pictureUrl,
  }) : super(key: key);

  @override
  State<PictureViewPage> createState() => _PictureViewPageState();
}

class _PictureViewPageState extends State<PictureViewPage> {

  //Custom cachemanager
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 1),
      maxNrOfCacheObjects: 50
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.pictureUrl, 
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                cacheManager: customCacheManager,
                key: UniqueKey(),
                imageUrl: widget.pictureUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: primary,width: 1.2),
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        _save();
                      },
                      child: Text(
                        'Download',
                        style: GoogleFonts.montserrat(textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color:Colors.white)),
                      )
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: const TextStyle(color: Colors.white),
                  )
                ),
                  const SizedBox(height: 80,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //Function to save a Picture to gallery
  _save() async {
   var response = await Dio().get(
      widget.pictureUrl,
      options: Options(responseType: ResponseType.bytes));
   final result = 
   await ImageGallerySaver.saveImage(
    Uint8List.fromList(response.data));
   print(result);
   Navigator.pop(context);
  }
}