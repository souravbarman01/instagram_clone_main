import 'package:get/get.dart';

import '../../home/domain/models/demo_avatars.dart';
import '../../home/domain/models/story_model.dart';
import '../domain/models/profile_model.dart';

class ProfileController extends GetxController implements GetxService {
  ProfileController() : _profile = _demoProfile;

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  final ProfileModel _profile;
  ProfileModel get profile => _profile;

  void setTabIndex(int index) {
    if (_tabIndex == index) return;
    _tabIndex = index;
    update();
  }
}

const ProfileModel _demoProfile = ProfileModel(
  username: 'jacob_w',
  displayName: 'Jacob West',
  avatarUrl:
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=256&h=256&fit=crop',
  posts: '54',
  followers: '834',
  following: '162',
  bioLine1: 'Digital goodies designer ',
  bioHandle: '@pixsellz',
  bioLine2: 'Everything is designed.',
  highlights: [
    StoryModel(name: 'New', imageUrl: demoAvatar1, isYourStory: true),
    StoryModel(name: 'Friends', imageUrl: demoAvatar2),
    StoryModel(name: 'Travel', imageUrl: demoAvatar4),
    StoryModel(name: 'Food', imageUrl: demoAvatar5),
  ],
  gridImages: [
    'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=1200',
    'https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200',
    'https://images.unsplash.com/photo-1505069442586-7a3b6c4f2b84?w=1200',
    'https://images.unsplash.com/photo-1520975958225-1c17b53b5a9a?w=1200',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200',
  ],
);
