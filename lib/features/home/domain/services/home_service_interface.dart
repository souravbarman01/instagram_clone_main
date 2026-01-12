import '../models/post_model.dart';
import '../models/story_model.dart';

abstract class HomeServiceInterface {
  Future<List<PostModel>> getPosts();
  Future<List<StoryModel>> getStories();
}
