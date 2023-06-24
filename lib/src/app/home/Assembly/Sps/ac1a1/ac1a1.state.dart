part of 'ac1a1.data.dart';


abstract class ac1a1State extends Equatable{
  const ac1a1State();
}

class  ac1a1Initial extends ac1a1State {
  const ac1a1Initial();

  @override
  List<Object> get props => [];
}

abstract class ac1a1Loading extends ac1a1State{
  const ac1a1Loading();
}

class DailyCalendarError extends ac1a1State {
  final String message;

  const DailyCalendarError(this.message);

  @override
  List<Object> get props => [message];
}
