abstract class HomeState{}

class InitHomeState extends HomeState{}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState({required this.errMessage});
}