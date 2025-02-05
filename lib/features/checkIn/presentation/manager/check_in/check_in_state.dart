part of 'check_in_cubit.dart';

@immutable
sealed class CheckInState {}

final class CheckInInitial extends CheckInState {}

final class CheckIn extends CheckInState {}

final class FetchData extends CheckInState {}

final class QrValidation extends CheckInState {}
