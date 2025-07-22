import 'package:arabic_to_english_converter_app/management/cubit.dart';
import 'package:arabic_to_english_converter_app/management/states.dart';
import 'package:arabic_to_english_converter_app/navigation_screens/games_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_projects/management/cubit.dart';
// import 'package:flutter_projects/management/states.dart';
// import 'package:flutter_projects/navigation_screens/games_screen.dart';
import '../components/drawer/about_screen.dart';
import '../components/drawer/themes_screen.dart';
import '../navigation_screens/community_screen.dart';
import '../navigation_screens/entertainment_screen.dart';
import '../navigation_screens/lessons_screen.dart';
import '../navigation_screens/progress_screen.dart';
import '../navigation_screens/quiz_categories_screen.dart';
import '../components/drawer/languages_translation_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppNavigateToThemesState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ThemesScreen()),
          );
        } else if (state is AppNavigateToLanguagesState) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LanguagesTranslationScreen()),
          );
        } else if (state is AppNavigateToAboutState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutScreen()),
          );
        }
      },
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appCubit.currentTheme,
          home: Scaffold(
            appBar: AppBar(
              title: Text(
                tr('Language Learning App'), // Use `tr()` for translation
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                // Use IndexedStack to keep the state of the screens
                IndexedStack(
                  index: appCubit.currentIndex,
                  children: const [
                    Lessons(),
                    QuizCategoriesScreenCategoriesScreen(),
                    EntertainmentScreen(),
                    CategorySelectionScreen(),
                    Progress(),
                    CommunityScreen(),
                  ],
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.settings,
                            size: 40, color: Colors.white),
                        SizedBox(width: screenWidth * 0.04),
                        Text(
                          tr('Settings'), // Apply `tr()` for translation
                          style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.light_mode, color: Colors.cyan),
                    title: Text(tr('Themes')), // Use `tr()` for translation
                    onTap: () {
                      appCubit.navigateToThemes();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.translate, color: Colors.cyan),
                    title: Text(tr('Languages')), // Use `tr()` for translation
                    onTap: () {
                      appCubit.navigateToLanguages();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.cyan),
                    title: Text(tr('About')), // Use `tr()` for translation
                    onTap: () {
                      appCubit.navigateToAbout();
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: appCubit.currentIndex,
              onTap: (index) => appCubit.changeIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.play_lesson),
                  label: tr('Lessons'), // Use `tr()` for translation
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.quiz),
                  label: tr('Quizzes'), // Use `tr()` for translation
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.movie),
                  label: tr('Entertainment'), // Use `tr()` for translation
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.games),
                  label: tr('Games'), // Use `tr()` for translation
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.bar_chart),
                  label: tr('Progress'), // Use `tr()` for translation
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.people),
                  label: tr('Community'), // Use `tr()` for translation
                ),
              ],
              selectedItemColor: Colors.cyan,
              unselectedItemColor: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
