import 'package:dio/dio.dart';
import '../models/photo_model.dart';

String apiKey = '563492ad6f91700001000001689e4b7aa88042c9b49156df03ab1f08';

class PhotosApii{
  
  //APi to get lists of curated pictures
  final Dio dio = Dio();
  Future<List<Photos>?> fetchPosts(String url) async{
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey'
          }
        ),
      );
      PhotosModel photosApi = PhotosModel.fromJson(response.data);
      return photosApi.photos;
    }on DioError catch (e) {
      print(e.toString());
      throw Exception('Failed to load posts');
    }
  }

  //APi to search pictures
  final Dio _dio = Dio();
  Future<List<Photos>?> searchPosts(String query,) async{
    try {
      Response response = await _dio.get(
        'https://api.pexels.com/v1/search?query=$query&per_page=50',
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey'
          }
        ),
      );
      PhotosModel photosApi = PhotosModel.fromJson(response.data);
      return photosApi.photos;
    }on DioError catch (e) {
      print(e.toString());
      throw Exception('Failed to load posts');
    }
  }
}