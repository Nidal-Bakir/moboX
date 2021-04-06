import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobox/core/auth/bloc/auth/auth_bloc.dart';
import 'package:mobox/route/app_router.dart';

import 'package:mobox/theme/theme.dart';
import 'package:mobox/injection/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.white.withAlpha(100),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => di.sl(),
      child: MaterialApp(
        onGenerateRoute: onGenerateRoute,
        title: 'Flutter Demo',
        theme: appTheme(),
      ),
    );
  }
}
