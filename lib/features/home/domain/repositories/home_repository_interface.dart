import '../models/post_model.dart';

abstract class HomeRepositoryInterface {
  Future<List<PostModel>> getPosts();
}
