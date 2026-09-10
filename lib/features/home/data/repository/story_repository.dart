import 'package:pogo/features/home/data/model/story_model.dart';

abstract class StoryRepository {
  Future<List<StoryModel>> getStories();
}