import 'package:arabic_to_english_converter_app/components/questions_and_answers.dart';
import 'package:arabic_to_english_converter_app/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_projects/components/questions_and_answers.dart';
// import 'package:flutter_projects/screens/quiz_screen.dart';

class QuizCategoriesScreenCategoriesScreen extends StatefulWidget {
  const QuizCategoriesScreenCategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState
    extends State<QuizCategoriesScreenCategoriesScreen> {
  String searchQuery = ''; // To hold the search query

  // List of image paths for the categories
  final List<String> categoryImages = [
    'assets/images/cards_background/alpha.jpg',
    'assets/images/cards_background/digits.jpg',
    'assets/images/cards_background/colors.jpg',
    'assets/images/cards_background/voc.jpg',
    'assets/images/cards_background/gre.jpg',
    'assets/images/cards_background/sent.jpg',
    'assets/images/cards_background/pre.jpg',
    'assets/images/cards_background/conv.jpg',
    'assets/images/cards_background/present.jpg',
    'assets/images/cards_background/past.jpg',
    'assets/images/cards_background/if.png',
    'assets/images/cards_background/rep.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // Filter categories based on the search query
    final filteredCategories = categories
        .where((category) =>
            category['title'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    // Create groups of four categories for each carousel
    List<List<dynamic>> categoryGroups = [];
    for (int i = 0; i < filteredCategories.length; i += 4) {
      categoryGroups.add(filteredCategories.sublist(
          i,
          i + 4 > filteredCategories.length
              ? filteredCategories.length
              : i + 4));
    }

    // Limit to three carousels or available groups
    List<List<dynamic>> threeCarousels = categoryGroups.length > 3
        ? categoryGroups.sublist(0, 3)
        : categoryGroups;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
          'Quizzes',
          style: TextStyle(fontSize: 18),
        ).tr()),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: threeCarousels.length,
                    itemBuilder: (context, groupIndex) {
                      // Define titles for each carousel
                      String carouselTitle;
                      switch (groupIndex) {
                        case 0:
                          carouselTitle = 'Beginner Quizzes';
                          break;
                        case 1:
                          carouselTitle = 'Intermediate Quizzes';
                          break;
                        case 2:
                          carouselTitle = 'Advanced Quizzes';
                          break;
                        default:
                          carouselTitle = '';
                      }

                      return Column(
                        children: [
                          // Header for each carousel
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  carouselTitle
                                      .tr(), // Call .tr() on the string
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.3, // Limit the height of each carousel
                            child: PageView.builder(
                              controller: PageController(viewportFraction: .9),
                              itemCount: threeCarousels[groupIndex]
                                  .length, // Set to the number of categories
                              itemBuilder: (context, index) {
                                final category =
                                    threeCarousels[groupIndex][index];

                                // Get the corresponding image for the category based on index
                                final imageIndex = groupIndex * 4 +
                                    index; // Calculate the index in categoryImages
                                final imagePath = categoryImages[imageIndex];

                                return GestureDetector(
                                  onTap: () {
                                    // Navigate to QuizScreen when a card is tapped
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuizScreen(
                                          categoryTitle: category['title'],
                                          questions: category['questions'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          image: AssetImage(imagePath),
                                          fit: BoxFit.fill,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                            ),
                                          ),
                                          child: Text(
                                            category['title'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(2, 2),
                                                  blurRadius: 3.0,
                                                  color: Colors.black54,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                              height: 16), // Spacing between carousels
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
