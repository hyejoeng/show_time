import 'package:show_time/data/repostiory/moive_repository.dart';

class MainTabViewModel {
  final MovieRepository _movieRepository;

  MainTabViewModel({required MovieRepository movieRepository}) : _movieRepository = movieRepository;
}