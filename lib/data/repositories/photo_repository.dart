import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/models/photo.dart';

class PhotoRepository {
  Map<String, Photo> photos = {};
  Map<String, DateTime> photoAccessTimes = {};
  final ApiClient _client = ApiClient();

  Future<Photo?> photo(String name) async {
    if (photos[name] == null ||
        DateTime.now().difference(photoAccessTimes[name]!).inDays >= 1) {
      photos.remove(name);
      photoAccessTimes.remove(name);
      await _requestPhoto(name);
    }
    return photos[name];
  }

  Future<void> _requestPhoto(String photoName) async {
    var photo = await _client.fetchPhoto(photoName);
    if (photo != null) {
      photos[photoName] = photo;
      photoAccessTimes[photoName] = DateTime.now();
    }
  }
}
