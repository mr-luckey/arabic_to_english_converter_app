import 'package:arabic_to_english_converter_app/components/drawer/language_switcher.dart';
import 'package:arabic_to_english_converter_app/components/language_dialog.dart';
import 'package:arabic_to_english_converter_app/components/language_tile.dart';
import 'package:arabic_to_english_converter_app/management/cubit.dart';
import 'package:arabic_to_english_converter_app/management/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_projects/components/drawer/language_switcher.dart';
// import 'package:flutter_projects/components/language_dialog.dart';
// import 'package:flutter_projects/components/language_tile.dart';
// import 'package:flutter_projects/management/cubit.dart';
// import 'package:flutter_projects/management/states.dart';

class LanguagesTranslationScreen extends StatelessWidget {
  const LanguagesTranslationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions using MediaQuery for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        final appCubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                'Switch Languages'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // LanguageSwitcher for the language icon
                  LanguageSwitcher(
                    languageCode: appCubit.locale.languageCode,
                    isDarkMode: appCubit.isDark,
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Text(
                    tr('Choose your preferred language:'), // Translatable text
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                        maxWidth: 400), // Max width for better layout control
                    child: Column(
                      children: [
                        LanguageTile(
                          languageCode: 'en',
                          languageName: 'English',
                          isSelected: appCubit.locale.languageCode == 'en',
                          onTap: () => _showRestartDialog(context, 'en'),
                          isDarkMode: appCubit.isDark,
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // Responsive spacing
                        LanguageTile(
                          languageCode: 'ar',
                          languageName: 'Arabic',
                          isSelected: appCubit.locale.languageCode == 'ar',
                          onTap: () => _showRestartDialog(context, 'ar'),
                          isDarkMode: appCubit.isDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: appCubit.isDark ? Colors.black : Colors.white,
        );
      },
    );
  }

  void _showRestartDialog(BuildContext context, String languageCode) {
    final appCubit = AppCubit.get(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RestartDialog(
          onConfirm: () {
            appCubit.changeLocale(languageCode);
          },
        );
      },
    );
  }
}
