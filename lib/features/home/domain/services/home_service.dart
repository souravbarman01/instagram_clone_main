import '../models/post_model.dart';
import '../repositories/home_repository_interface.dart';
import 'home_service_interface.dart';

class HomeService implements HomeServiceInterface {
  HomeService({required HomeRepositoryInterface repository})
      : _repository = repository;

  final HomeRepositoryInterface _repository;

  @override
  Future<List<PostModel>> getPosts() {
    return _repository.getPosts();
  }
}
