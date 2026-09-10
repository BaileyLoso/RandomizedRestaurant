import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/models/photo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_repository.g.dart';

class PhotoCacheEntry {
  final Photo photo;
  final DateTime accessTime;
  PhotoCacheEntry(this.photo, this.accessTime);
}

@riverpod
class PhotoRepository extends _$PhotoRepository {
  final ApiClient _client = ApiClient();

  @override
  Map<String, PhotoCacheEntry> build() => {};

  Future<Photo> photo(String name, {bool? debug}) async {
    final cached = state[name];
    final isStale =
        cached == null ||
        DateTime.now().difference(cached.accessTime).inDays >= 1;
    if (isStale && debug != null && debug) {
      return await _requestSamplePhoto(name);
    }
    if (isStale) {
      return await _requestPhoto(name);
    }
    return cached.photo;
  }

  Future<Photo> _requestPhoto(String photoName) async {
    var photo = await _client.fetchPhoto(photoName);
    state = {...state, photoName: PhotoCacheEntry(photo, DateTime.now())};
    return photo;
  }

  Future<Photo> _requestSamplePhoto(String photoName) async {
    var photo = await _client.fetchSamplePhoto(photoName);
    state = {...state, photoName: PhotoCacheEntry(photo, DateTime.now())};
    return photo;
  }
}
