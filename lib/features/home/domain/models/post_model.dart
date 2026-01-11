class PostModel {
  const PostModel({
    required this.userName,
    required this.userAvatarUrl,
    required this.location,
    required this.images,
    required this.likedByUser,
    required this.likesCount,
    required this.caption,
  });


  final String userName;
  final String userAvatarUrl;
  final String location;
  final List<String> images;
  final String likedByUser;
  final int likesCount;
  final String caption;
}


const testPosts = <PostModel>[
  PostModel(
    userName: 'joshua_l',
    userAvatarUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=256&h=256&fit=crop",
    location: 'Tokyo, Japan',
    images: [
      'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=1200',
      'https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200',
      'https://images.unsplash.com/photo-1505069442586-7a3b6c4f2b84?w=1200',
    ],
    likedByUser: 'craig_love',
    likesCount: 44686,
    caption: 'The game in Japan was amazing and I want to share some photos',
  ),

  PostModel(
    userName: 'sourav_001',
    userAvatarUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=256&h=256&fit=crop",
    location: 'Tokyo, Japan',
    images: [
      'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=1200',
      'https://images.unsplash.com/photo-1549692520-acc6669e2f0c?w=1200',
      'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=1200',
    ],
    likedByUser: 'craig_love',
    likesCount: 44686,
    caption: 'The game in Japan was amazing and I want to share some photos',
  ),
  PostModel(
    userName: 'sourav_001',
    userAvatarUrl: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=256&h=256&fit=crop",
    location: 'Tokyo, Japan',
    images: [
      'https://i.pinimg.com/736x/69/19/59/691959b187b2b253eb2a8aaff72200b5.jpg',
      'https://i.pinimg.com/736x/1b/a0/ab/1ba0aba628d820033131446a047fe8b0.jpg',
      'https://i.pinimg.com/236x/ac/9e/ae/ac9eae1c2dfe5372f3448d2d46fb2202.jpg',
    ],
    likedByUser: 'craig_love',
    likesCount: 44686,
    caption: 'Nature is beautiful!',
  ),
];