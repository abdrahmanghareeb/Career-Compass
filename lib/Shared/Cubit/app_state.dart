part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
//for the eye icon in the password field
final class LoginIconState extends AppState {}
final class LoginState extends AppState {}
final class RegisterState extends AppState {}
