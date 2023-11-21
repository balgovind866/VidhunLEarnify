import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:student_deshboard/routes.dart';
import 'package:student_deshboard/screens/blocStudent/auth/auth_cubit.dart';
import 'package:student_deshboard/screens/blocStudent/credencial/credencial_cubit.dart';
import 'package:student_deshboard/screens/blocStudent/student_bloc_cubit.dart';
import 'package:student_deshboard/screens/flesh_screan/flesh_screen.dart';
import 'package:student_deshboard/screens/persantation/teacher/bloc/teacher_cubit.dart';
import 'injector_config.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await di.init();
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider<TeacherCubit>(
          create: (context) => di.sl<TeacherCubit>()),
      BlocProvider<StudentBlocCubit>(
          create: (context) => di.sl<StudentBlocCubit>()),

      BlocProvider<AuthCubit>(
        create: (_) => di.sl<AuthCubit>()..appStarted(),
      ),
      BlocProvider<CredentialCubit>(
        create: (_) => di.sl<CredentialCubit>(),
      ),
    ],
    child: const MyApp(),
  ),

  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color(0xFF2A2D3E).withOpacity(1),
          primaryColor: Colors.green,

          textTheme: GoogleFonts.sourceCodeProTextTheme(
              Theme
                  .of(context)
                  .textTheme
                  .apply()
                  .copyWith(
                bodyText1: TextStyle(color: Colors.white, fontSize: 50,
                  fontStyle: FontStyle.italic,

                  fontWeight: FontWeight.w700,
                ),
                subtitle1: TextStyle(
                    color: Colors.white,
                    fontSize: SizerUtil.deviceType == DeviceType.tablet ? 14.sp : 17.sp,
                    fontWeight: FontWeight.w700),

                subtitle2: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white,
                    fontSize: SizerUtil.deviceType == DeviceType.tablet ? 8.sp : 9.sp,
                      fontWeight: FontWeight.w300

                  ),
                ),
              )
          ),

          useMaterial3: true,
        ),
        onGenerateRoute: NamedRouter.generateRoute,
        home: FlexScreen(),
      );
    });
  }
}


