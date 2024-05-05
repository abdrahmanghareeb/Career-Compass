part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

//for the eye icon in the password field
final class LoginIconState extends AppState {}
final class LoginSuccessState extends AppState {}
final class LoginLoadingtate extends AppState {}
final class LoginErrorState extends AppState {}
final class RegisterSuccessState extends AppState {}
final class RegisterLoadingState extends AppState {}
final class RegisterErrorState extends AppState {}
final class createUserSuccessState extends AppState {}
final class createUserLoadingState extends AppState {}
final class createUserErrorState extends AppState {}
