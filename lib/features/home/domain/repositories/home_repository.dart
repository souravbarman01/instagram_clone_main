import 'package:instagram_clone_main/api/api_client.dart';

import '../models/post_model.dart';
import 'home_repository_interface.dart';

class HomeRepository implements HomeRepositoryInterface {
  HomeRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<List<PostModel>> getPosts() async {
    final decoded = await _apiClient.getData(
      'lib/features/home/domain/repositories/postData.json',
    );
    final posts = decoded is Map<String, dynamic>
        ? decoded['posts']
        : decoded;

    if (posts is! List) {
      return [];
    }

    return posts
        .whereType<Map<String, dynamic>>()
        .map(PostModel.fromJson)
        .toList();
  }
}
