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
}