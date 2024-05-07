part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

//--------------------------------------------------//
final class GetLocalPhotoLoadingState extends AppState {}
final class GetLocalPhotoSuccessState extends AppState {}
final class GetLocalPhotoErrorState extends AppState {}
//--------------------------------------------------//
final class UpdateProfileLoadingState extends AppState {}
final class UpdateProfileSuccessState extends AppState {}
final class UpdateProfileErrorState extends AppState {}
//-------------------settings
final class SetDropDownState extends AppState {}

final class SetFingerprintState extends AppState {}

final class fingerprintState extends AppState {}

