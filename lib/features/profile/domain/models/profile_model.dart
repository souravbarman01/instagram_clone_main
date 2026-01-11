import '../../../home/domain/models/story_model.dart';

class ProfileModel {
  const ProfileModel({
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    required this.posts,
    required this.followers,
    required this.following,
    required this.bioLine1,
    required this.bioHandle,
    required this.bioLine2,
    required this.highlights,
    required this.gridImages,
  });

  final String username;
  final String displayName;
  final String avatarUrl;
  final String posts;
  final String followers;
  final String following;

  final String bioLine1;
  final String bioHandle;
  final String bioLine2;

  final List<StoryModel> highlights;
  final List<String> gridImages;
}

