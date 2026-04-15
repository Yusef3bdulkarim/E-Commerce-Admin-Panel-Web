import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/data/repo/auth_repo.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/logic/auth_cubit.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/logic/dashboard_cubit.dart';

import '../../feature/media_screen/data/repo/media_repo.dart';
import '../../feature/media_screen/logic/media_cubit.dart';
import '../common/widgets/data_table/table_controller/table_controller_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton<MediaRepo>(() => MediaRepo());
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit());
  getIt.registerLazySingleton<TableControllerCubit>(
      () => TableControllerCubit());
  getIt.registerLazySingleton<DashboardCubit>(() => DashboardCubit());
  getIt.registerLazySingleton<MediaCubit>(() => MediaCubit());
}
