part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

//--------------------------------------------------//
final class GetLocalPhotoSuccessState extends AppState {}
final class GetLocalPhotoErrorState extends AppState {}
//--------------------------------------------------//
final class UpdateLoadingSuccessState extends AppState {}
final class UpdateProfileSuccessState extends AppState {}
final class UpdateProfileErrorState extends AppState {}