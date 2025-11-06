import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mbti_quiz/providers/quiz_provider.dart';
import 'package:mbti_quiz/providers/theme_provider.dart';
import 'package:mbti_quiz/screens/welcome_screen.dart';
import 'package:mbti_quiz/screens/about_mbti_screen.dart';
import 'package:mbti_quiz/screens/main_screen.dart';
import 'package:mbti_quiz/screens/quiz_screen.dart';
import 'package:mbti_quiz/screens/result_screen.dart';
import 'package:mbti_quiz/screens/history_screen.dart';
import 'package:mbti_quiz/widgets/theme/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => QuizProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'MBTI Personality Test',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => WelcomeScreen(),
              '/about': (context) => AboutMBTIScreen(),
              '/main': (context) => MainScreen(),
              '/quiz': (context) => QuizScreen(),
              '/result': (context) => ResultScreen(),
              '/history': (context) => HistoryScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}