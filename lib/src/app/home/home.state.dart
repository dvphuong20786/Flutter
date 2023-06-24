part of 'home.controlner.dart';


abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}


class HomeLoaded extends HomeState {
  final List<int> isUsingFunction;
  final int countNoti;
  final int countContactRemind;
  HomeLoaded(this.isUsingFunction, this.countNoti, this.countContactRemind);

  List<Object> get props => [];
}

class OffsetChanged extends HomeState {
  final double offset;

  OffsetChanged(this.offset);

  @override
  List<Object> get props => [offset];
}

class NotificationChanged extends HomeState {
  final int count;

  NotificationChanged(this.count);

  @override
  List<Object> get props => [count];
}

class MainLoaded extends HomeState {
  MainLoaded();

  @override
  List<Object> get props => [];
}

class ContactReminderChanged extends HomeState {
  final int count;

  ContactReminderChanged(this.count);

  @override
  List<Object> get props => [count];
}

class LoggingOut extends HomeState {
  const LoggingOut();

  @override
  List<Object> get props => [];
}

class LoggedOut extends HomeState {
  const LoggedOut();

  @override
  List<Object> get props => [];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
