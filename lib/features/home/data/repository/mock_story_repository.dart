import 'package:pogo/features/home/data/model/story_model.dart';
import 'package:pogo/features/home/data/repository/story_repository.dart';

class MockStoryRepository implements StoryRepository {
  @override
  Future<List<StoryModel>> getStories() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return const [
      StoryModel(
        id: '1',
        name: 'Sarah',
        category: 'Hair Styling',
        imageUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
      ),
      StoryModel(
        id: '2',
        name: 'Sarah',
        category: 'Hair Styling',
        imageUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      ),
      StoryModel(
        id: '3',
        name: 'Sarah',
        category: 'Hair Styling',
        imageUrl: 'https://randomuser.me/api/portraits/men/6.jpg',
      ),
    ];
  }
}
