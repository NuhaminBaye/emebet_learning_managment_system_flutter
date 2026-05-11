import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/log/app_logger.dart';
import 'package:lms_mobileapp/core/network/dio_network.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/checkout_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/course_detail_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/assignment_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/quiz_screen.dart';
import 'package:lms_mobileapp/features/auth/presentation/auth_module.dart';
import 'package:lms_mobileapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/login_screen.dart';
import 'package:lms_mobileapp/features/init/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:lms_mobileapp/features/init/presentation/screens/splash_screen.dart';
import 'package:lms_mobileapp/core/navigation/role_based_router.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/courses/add_lesson_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/courses/create_assignment_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/courses/curriculum_builder_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/courses/student_comments_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/courses/quiz_builder_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/main/instructor_shell_screen.dart';
import 'package:lms_mobileapp/features/instructor/presentation/screens/trainees/trainees_screen.dart';
import 'package:lms_mobileapp/features/trainee/presentation/screens/main/student_shell_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logger
  initRootLogger();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Hive
  await Hive.initFlutter();

  // Initialize Dio
  await DioNetwork.initDio(30); // 30 seconds timeout

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Emebet's Academy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: AppTextTheme.textTheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.textPrimary),
        ),
      ),
      // home: BlocProvider(
      //   create: (_) => AuthModule.createBloc()..add(GetCurrentUserRequested()),
      //   child: const RoleBasedRouter(),
      // ),
      home: const InstructorShellScreen(),
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.onboarding: (_) => const OnboardingScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.StudentShellScreenState: (_) => const StudentShellScreen(),
        AppRoutes.instructorShell: (_) => const InstructorShellScreen(),
        AppRoutes.curriculumBuilder: (_) => const CurriculumBuilderScreen(),
        AppRoutes.addLesson: (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;
          return AddLessonScreen(
            courseId: args?['courseId'] as String?,
          );
        },
        AppRoutes.createAssignment: (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;
          return CreateAssignmentScreen(
            courseId: args?['courseId'] as String?,
          );
        },
        AppRoutes.createQuiz: (_) => const QuizBuilderScreen(),
        AppRoutes.studentComments: (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;
          return StudentCommentsScreen(
            lessonId: args?['lessonId'] as String?,
            lessonTitle: args?['lessonTitle'] as String?,
          );
        },
        AppRoutes.TraineesScreen: (_) => const TraineesScreen(),
        AppRoutes.courseDetails: (_) => const CourseDetailScreen(),
        AppRoutes.checkOut: (_) => const CheckoutScreen(),
      },
    );
  }
}
