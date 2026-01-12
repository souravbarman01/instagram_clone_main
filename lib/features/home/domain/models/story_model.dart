class StoryModel {
  const StoryModel({
    required this.name,
    required this.imageUrl,
    this.isLive = false,
    this.isYourStory = false,
  });

  final String name;
  final String imageUrl;
  final bool isLive;
  final bool isYourStory;

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      name: json['name']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      isLive: json['isLive'] == true,
      isYourStory: json['isYourStory'] == true,
    );
  }
}
