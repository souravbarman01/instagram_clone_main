class PostModel {
  const PostModel({
    required this.userName,
    required this.userAvatarUrl,
    required this.location,
    required this.images,
    required this.likedByUser,
    required this.likesCount,
    required this.caption,
  });

  final String userName;
  final String userAvatarUrl;
  final String location;
  final List<String> images;
  final String likedByUser;
  final int likesCount;
  final String caption;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final rawLikesCount = json['likesCount'];
    final likesCount = rawLikesCount is int
        ? rawLikesCount
        : int.tryParse(rawLikesCount?.toString() ?? '') ?? 0;
    final images = (json['images'] as List<dynamic>? ?? [])
        .map((image) => image.toString())
        .toList();

    return PostModel(
      userName: json['userName']?.toString() ?? '',
      userAvatarUrl: json['userAvatarUrl']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      images: images,
      likedByUser: json['likedByUser']?.toString() ?? '',
      likesCount: likesCount,
      caption: json['caption']?.toString() ?? '',
    );
  }
}
