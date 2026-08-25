class Photo {
  final String name;
  final String uri;

  Photo({required this.name, required this.uri});

  factory fromPhotoApi(Map<String, dynamic> json) {
    return Photo(name: json['name'] ?? '', uri: json['photoUri'] ?? '');
  }

  @override
  bool operator ==(Object other) {
    return other is Photo && other.name == name && other.uri == uri;
  }

  @override
  int get hashCode => Object.hash(name, uri);
}
