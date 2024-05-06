import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_app/constants.dart';
import 'package:heart_app/core/utils/routes.dart';
import 'package:heart_app/features/start/presentation/cubits/predict_cubit/predict_cubit.dart';

void main() {
  runApp(const HeartApp());
}

class HeartApp extends StatelessWidget {
  const HeartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PredictCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoute.router,
        theme: ThemeData.dark().copyWith(
          dialogBackgroundColor: Colors.transparent,
          textSelectionTheme:
              TextSelectionThemeData(selectionHandleColor: kSpecialColor),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kSpecialColor,
              ),
            ),
          ),
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
