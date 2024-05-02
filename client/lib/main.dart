import 'package:education_app/features/card_page/view/card_page_screen.dart';
import 'package:education_app/features/course_page/view/create_course_page_screen.dart';
import 'package:education_app/features/group_page/view/group_page_screen.dart';
import 'package:education_app/generated/l10n.dart';
import 'package:education_app/models/course_arguments.dart';
import 'package:education_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'features/card_page/view/create_card_page_screen.dart';
import 'features/course_page/course_page.dart';
import 'features/courses_list_page/view/courses_list_page_sceen.dart';
import 'features/home_page/home_page.dart';
import 'features/reviews_page/reviews_page.dart';
import 'features/settings_page/settings_page.dart';
import 'features/login_page/login_page.dart';
import 'features/sign_up_page/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale("ru"),
        title: 'Education App',
        theme: themeData,
        routes: {
          // '/': (context) => CardPage(),
          // '/': (context) => CourseCompletionScreen(),
          '/': (context) => HomePageScreen(),
          '/course': (context) {
            final courseId = ModalRoute.of(context)?.settings.arguments as int;
            return CoursePage(courseId: courseId);
          },
          '/reviews-list': (context) => ReviewsListPageScreen(),
          '/log-in': (context) => LogInPage(),
          '/sign-up': (context) => SignPage(),
          '/card': (context) => CardPage(),
          '/create-card': (context) {
            final courseId = ModalRoute.of(context)?.settings.arguments as int;
            return CreateCardPage(courseId: courseId);
          },
          '/create-course': (context) => CreateCoursePage(),
          '/settings': (context) => SettingsPageScreen(),
          '/group': (context) => GroupPageScreen(),
          '/courses-list': (context) {
            final args =
                ModalRoute.of(context)!.settings.arguments as CourseArguments;
            return CoursesListScreen(args);
          },
        },
      ),
    );
  }
}
