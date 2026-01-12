import 'package:get/get.dart';

import '../domain/models/post_model.dart';
import '../domain/services/home_service_interface.dart';

class HomeController extends GetxController implements GetxService {
  HomeController({required HomeServiceInterface homeService})
      : _homeService = homeService;

  final HomeServiceInterface _homeService;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadPosts() async {
    _isLoading = true;
    _errorMessage = null;
    update();

    try {
      _posts = await _homeService.getPosts();
    } catch (error) {
      _errorMessage = 'Failed to load posts';
    } finally {
      _isLoading = false;
      update();
    }
  }

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    update();
  }
}
