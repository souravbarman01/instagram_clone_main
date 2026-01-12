import '../models/post_model.dart';

abstract class HomeServiceInterface {
  Future<List<PostModel>> getPosts();
}
