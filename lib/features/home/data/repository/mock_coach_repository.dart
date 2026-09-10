import 'package:pogo/features/home/data/model/coach_model.dart';
import 'package:pogo/features/home/data/model/special_population_coach.dart';
import 'package:pogo/features/home/data/repository/coach_repository.dart';

class MockCoachRepository implements CoachRepository {
  @override
  Future<List<CoachModel>> getTopCoaches() async {
    await Future.delayed(Duration(milliseconds: 400));

    return const [
      CoachModel(
        id: '1',
        name: 'Coach Name',
        category: 'Meditation',
        experience: '5 years',
        rating: 4.8,
        isFavorite: false,
        imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      ),
      CoachModel(
        id: '2',
        name: 'Coach Name',
        category: 'Cardio',
        experience: "3 years",
        rating: 4.5,
        isFavorite: false,
        imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      ),
      CoachModel(
        id: '3',
        name: 'Coach Name',
        category: 'Yoga',
        experience: "7 years",
        rating: 4.9,
        isFavorite: false,
        imageUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
      ),
      CoachModel(
        id: '4',
        name: 'Coach Name',
        category: 'HIIT',
        experience: "4 years",
        rating: 4.6,
        isFavorite: false,
        imageUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
      ),
    ];
  }

  @override
  Future<List<SpecialPopulationCoachModel>>
      getSpecialPopulationCoaches() async {
    await Future.delayed(Duration(milliseconds: 400));

    return const [
      SpecialPopulationCoachModel(
        id: "1",
        title: "Coach Science",
        description: "",
        imageUrl: "https://randomuser.me/api/portraits/men/6.jpg",
      ),
      SpecialPopulationCoachModel(
        id: "2",
        title: "Coach Management",
        description: "",
        imageUrl: "https://randomuser.me/api/portraits/women/7.jpg",
      ),
    ];
  }
}
