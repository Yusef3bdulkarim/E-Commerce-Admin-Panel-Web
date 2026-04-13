import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/logic/auth_cubit.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/logic/dashboard_cubit.dart';
import 'package:yt_ecommerce_admin_panel/feature/media/logic/media_cubit.dart';
import 'app.dart';
import 'core/common/widgets/data_table/table_controller/table_controller_cubit.dart';
import 'core/service_git_it/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupServiceLocator();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  usePathUrlStrategy();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => getIt<TableControllerCubit>()),
        BlocProvider(
            create: (_) => getIt<DashboardCubit>()),
        BlocProvider(
            create: (_) => getIt<MediaCubit>()),
      ],
      child: const App(),
    ),
  );
}
