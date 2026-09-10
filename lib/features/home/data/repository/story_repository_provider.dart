import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pogo/features/home/data/repository/mock_story_repository.dart';
import 'package:pogo/features/home/data/repository/story_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "story_repository_provider.g.dart";

@riverpod
StoryRepository storyRepository(Ref ref) {
  return MockStoryRepository();
}
