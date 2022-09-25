import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../models/photo_model.dart';
import '../screens/pages/picture_view_page.dart';
import '../services/dio.dart';

class PopularList extends StatefulWidget {
  const PopularList({super.key});

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
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
    return FutureBuilder<List<Photos>?>(
      future: PhotosApii().fetchPosts('https://api.pexels.com/v1/curated?per_page=15'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        } else {
          List<Photos> pictures = snapshot.data!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: pictures.length,
            itemBuilder: (context, index){
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
                  child: AspectRatio(
                    aspectRatio: 2.5/3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
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
                  ),
                ),
              );
            }
          );
        }
      },
    );
  }
}