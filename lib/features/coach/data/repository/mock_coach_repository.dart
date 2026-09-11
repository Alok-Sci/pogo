import 'package:pogo/features/coach/data/model/coach_detail_model.dart';
import 'package:pogo/features/coach/data/model/review_model.dart';
import 'package:pogo/features/coach/data/model/coach_model.dart';
import 'package:pogo/features/home/data/model/special_population_coach.dart';
import 'package:pogo/features/coach/data/repository/coach_repository.dart';

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
        description: "Professional focused on dietary science to improve physical performance and overall health outcomes.",
        imageUrl: "https://randomuser.me/api/portraits/men/6.jpg",
      ),
      SpecialPopulationCoachModel(
        id: "2",
        title: "Coach Management",
        description: "Consultant in effective stress reduction strategies, utilizing mindfulness and behavioral therapies.",
        imageUrl: "https://randomuser.me/api/portraits/women/7.jpg",
      ),
    ];
  }

  @override
  Future<CoachDetailModel> getCoachDetail(String coachId) async {
    await Future.delayed(Duration(milliseconds: 400));
    
    final education = "PhD in Clinical Psychology";
    final availabilityStatus = "Available";
    const serviceInformation = "Service Category: Weight Loss, Weigh gain\n\nLorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book.";
    final mockReviews = [
          ReviewModel(
            id: "1",
            authorName: "Emily Carter",
            authorImageUrl: "https://randomuser.me/api/portraits/men/10.jpg",
            publishDate: "15th Sept 2024",
            rating: 4,
            text: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
          ),
          ReviewModel(
            id: "2",
            authorName: "Thompson",
            authorImageUrl: "https://randomuser.me/api/portraits/women/11.jpg",
            publishDate: "10th Sept 2024",
            rating: 3,
            text: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
          ),
          ReviewModel(
            id: "3",
            authorName: "Aisha Patel",
            authorImageUrl: "https://randomuser.me/api/portraits/men/12.jpg",
            publishDate: "30th Sept 2024",
            rating: 4,
            text: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
          ),
        ];

    final coachDetailsList = [
      CoachDetailModel(
        id: "1",
        coach: const CoachModel(
          id: "1",
          name: "Coach Name",
          category: "Meditation",
          experience: "5 years",
          rating: 4.8,
          isFavorite: false,
          imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
        ),
        education: education,
        availabilityStatus: availabilityStatus,
        reviewCount: 3_545,
        serviceInformation: serviceInformation,
        reviews: mockReviews,
      ),
      CoachDetailModel(
        id: "2",
        coach: const CoachModel(
          id: "2",
          name: "Coach Name",
          category: "Cardio",
          experience: "3 years",
          rating: 4.5,
          isFavorite: false,
          imageUrl: "https://randomuser.me/api/portraits/men/2.jpg",
        ),
        education: education,
        availabilityStatus: availabilityStatus,
        reviewCount: 3_545,
        serviceInformation: serviceInformation,
        reviews: mockReviews,
          ),
      CoachDetailModel(
        id: "3",
        coach: const CoachModel(
            id: "3",
          name: "Coach Name",
          category: "Yoga",
          experience: "7 years",
          rating: 4.9,
          isFavorite: false,
          imageUrl: "https://randomuser.me/api/portraits/women/3.jpg",
        ),
        education: education,
        availabilityStatus: availabilityStatus,
        reviewCount: 3_545,
        serviceInformation: serviceInformation,
        reviews: mockReviews,
          ),
      CoachDetailModel(
        id: "4",
        coach: const CoachModel(
        id: "4",
          name: "Coach Name",
          category: "HIIT",
          experience: "4 years",
          rating: 4.6,
          isFavorite: false,
          imageUrl: "https://randomuser.me/api/portraits/men/4.jpg",
        ),
        education: education,
        availabilityStatus: availabilityStatus,
        reviewCount: 3_545,
        serviceInformation: serviceInformation,
        reviews: mockReviews,
          ),
    ];

    return coachDetailsList.firstWhere((element) => element.id == coachId);
  }
}
