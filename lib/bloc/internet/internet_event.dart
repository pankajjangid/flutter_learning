part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class InternetConnectedEvent extends InternetEvent{}

class InternetDisconnectedEvent extends InternetEvent{}
