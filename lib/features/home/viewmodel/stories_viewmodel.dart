import 'package:pogo/features/home/data/model/story_model.dart';
import 'package:pogo/features/home/data/repository/story_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stories_viewmodel.g.dart';

@riverpod
class StoriesViewModel extends _$StoriesViewModel {
  @override
  Future<List<StoryModel>> build() {
    return ref.watch(storyRepositoryProvider).getStories();
  }
}
