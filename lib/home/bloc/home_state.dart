part of 'home_bloc.dart';

enum HomeStatus { list, details, cart }

final class HomeState extends Equatable {
  const HomeState({this.status = HomeStatus.list});

  final HomeStatus status;

  const HomeState.enableList() : status = HomeStatus.list;

  const HomeState.enableDetails() : status = HomeStatus.details;

  const HomeState.enableCart() : status = HomeStatus.cart;

  @override
  List<Object> get props => [status];
}
