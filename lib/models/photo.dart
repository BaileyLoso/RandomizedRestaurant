class Photo {
  final String name;
  final String uri;
  int? maxWidth;
  int? maxHeight;

  Photo({required this.name, required this.uri, this.maxWidth, this.maxHeight});

  factory fromPhotoJson(
    Map<String, dynamic> json, {
    int? maxWidth,
    int? maxHeight,
  }) {
    return Photo(
      name: json['name'] ?? '',
      uri: json['photoUri'] ?? '',
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Photo && other.name == name && other.uri == uri;
  }

  @override
  int get hashCode => Object.hash(name, uri);
}
