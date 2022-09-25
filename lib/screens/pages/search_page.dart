import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpix/screens/bottom_nav.dart';
import 'package:wallpix/screens/pages/picture_view_page.dart';
import '../../models/photo_model.dart';
import '../../services/dio.dart';

class SearchPage extends StatefulWidget {
  final String searchQuery;
  const SearchPage({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //for search term
  TextEditingController searchController = TextEditingController();
  
  //Custom cachemanager
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 1),
      maxNrOfCacheObjects: 50
    ),
  );

  @override
  void initState() {
    super.initState();
    searchController.text = widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)
        ),
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(
          searchController.text,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize:17,color: primary,letterSpacing: 0.5)),
        ),
      ),
      body: FutureBuilder<List<Photos>?>(
        future: PhotosApii().searchPosts(searchController.text),
        builder: (context,snapshot){
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive(),);
          } else{
            List<Photos> pictures = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: pictures.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2/3
                  ), 
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => PictureViewPage(
                            pictureUrl: pictures[index].src!.portrait ?? '',
                          ),
                        )
                      );
                    },
                    child: Hero(
                      tag: pictures[index].src!.portrait ?? '',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            cacheManager: customCacheManager,
                            key: UniqueKey(),
                            imageUrl: pictures[index].src!.portrait ?? '',
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                  );
                }
              ),
            );
          }
        }
      )
    );
  }
}

