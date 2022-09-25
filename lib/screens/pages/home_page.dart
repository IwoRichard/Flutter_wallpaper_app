import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wallpix/models/photo_model.dart';
import 'package:wallpix/screens/pages/picture_view_page.dart';
import 'package:wallpix/screens/pages/search_page.dart';
import 'package:wallpix/services/dio.dart';
import '../bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //For api pagination
  int page =1;
  void increment(){
    setState(() {
      page++;
    });
  }
  //For search
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Wall',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20,color: Colors.black,letterSpacing: 0.5)),
              ),
              TextSpan(
                text: 'Pix',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20,color: primary,letterSpacing: 0.5)),
              ),
            ]
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.01),
                borderRadius: BorderRadius.circular(5)
              ),
              child: TextFormField(
                controller: searchController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 16,color: Colors.grey)),
                  prefixIcon: Icon(Iconsax.search_normal_14,size: 18,color: Colors.grey,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                ),
                onFieldSubmitted: (value) {
                  PhotosApii().searchPosts(searchController.text);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=>SearchPage(searchQuery: searchController.text)
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          await PhotosApii().fetchPosts('https://api.pexels.com/v1/search?query=wallpaper&per_page=40&page=$page');
          setState(() {
            increment();
          });
        },
        child: FutureBuilder<List<Photos>?>(
          future: PhotosApii().fetchPosts('https://api.pexels.com/v1/search?query=wallpaper&per_page=40&page=$page'),
          builder: (context,snapshot){
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(),);
            } else{
              List<Photos> pictures = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: pictures.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
        ),
      ),
    );
  }
}
