import 'package:get/get.dart';

import '../domain/models/post_model.dart';
import '../domain/models/story_model.dart';
import '../domain/services/home_service_interface.dart';

class HomeController extends GetxController implements GetxService {
  HomeController({required HomeServiceInterface homeService})
      : _homeService = homeService;

  final HomeServiceInterface _homeService;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  List<StoryModel> _stories = [];
  List<StoryModel> get stories => _stories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isStoriesLoading = false;
  bool get isStoriesLoading => _isStoriesLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _storiesErrorMessage;
  String? get storiesErrorMessage => _storiesErrorMessage;

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

  Future<void> loadStories() async {
    _isStoriesLoading = true;
    _storiesErrorMessage = null;
    update();

    try {
      _stories = await _homeService.getStories();
    } catch (error) {
      _storiesErrorMessage = 'Failed to load stories';
    } finally {
      _isStoriesLoading = false;
      update();
    }
  }

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    update();
  }
}
