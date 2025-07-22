import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Empower Your Language',
            style: TextStyle(fontSize: 18),
          ).tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: buildSectionTitle(context, 'Movie Recommendations')),
              buildCarousel([
                {
                  'title': 'The Shawshank Redemption',
                  'image': 'assets/images/entertainment/1.jpg',
                  'link': 'https://www.imdb.com/title/tt0111161/'
                },
                {
                  'title': 'The Godfather',
                  'image': 'assets/images/entertainment/2.jpg',
                  'link': 'https://www.imdb.com/title/tt0068646/'
                },
                {
                  'title': 'The Dark Knight',
                  'image': 'assets/images/entertainment/3.jpg',
                  'link': 'https://www.imdb.com/title/tt0468569/'
                },
                {
                  'title': 'See You On Venus',
                  'image': 'assets/images/entertainment/4.jpg',
                  'link': 'https://www.imdb.com/title/tt14960612/'
                },
                {
                  'title': 'Forrest Gump',
                  'image': 'assets/images/entertainment/5.jpg',
                  'link': 'https://www.imdb.com/title/tt0109830/'
                },
                {
                  'title': 'Inception',
                  'image': 'assets/images/entertainment/6.jpg',
                  'link': 'https://www.imdb.com/title/tt1375666/'
                },
                {
                  'title': 'The Matrix',
                  'image': 'assets/images/entertainment/7.jpg',
                  'link': 'https://www.imdb.com/title/tt0133093/'
                },
                {
                  'title': 'Fight Club',
                  'image': 'assets/images/entertainment/8.jpg',
                  'link': 'https://www.imdb.com/title/tt0137523/'
                },
                {
                  'title': 'The Lord of the Rings: The Return of the King',
                  'image': 'assets/images/entertainment/9.jpg',
                  'link': 'https://www.imdb.com/title/tt0167260/'
                },
                {
                  'title': 'La La Land',
                  'image': 'assets/images/entertainment/10.jpg',
                  'link': 'https://www.imdb.com/title/tt3783958/'
                },
              ]),
              const SizedBox(height: 20),
              Center(child: buildSectionTitle(context, 'Series Recommendations')),
              buildCarousel([
                {
                  'title': 'Friends',
                  'image': 'assets/images/entertainment/11.jpg',
                  'link': 'https://www.imdb.com/title/tt0108778/'
                },
                {
                  'title': 'Breaking Bad',
                  'image': 'assets/images/entertainment/12.jpg',
                  'link': 'https://www.imdb.com/title/tt0903747/'
                },
                {
                  'title': 'Game of Thrones',
                  'image': 'assets/images/entertainment/13.jpg',
                  'link': 'https://www.imdb.com/title/tt0944947/'
                },
                {
                  'title': 'The Crown',
                  'image': 'assets/images/entertainment/14.jpg',
                  'link': 'https://www.imdb.com/title/tt4786824/'
                },
                {
                  'title': 'Stranger Things',
                  'image': 'assets/images/entertainment/15.jpg',
                  'link': 'https://www.imdb.com/title/tt4574334/'
                },
                {
                  'title': 'Sherlock',
                  'image': 'assets/images/entertainment/16.jpg',
                  'link': 'https://www.imdb.com/title/tt1475582/'
                },
                {
                  'title': 'The Office',
                  'image': 'assets/images/entertainment/17.jpg',
                  'link': 'https://www.imdb.com/title/tt0386676/'
                },
                {
                  'title': 'Narcos',
                  'image': 'assets/images/entertainment/18.jpg',
                  'link': 'https://www.imdb.com/title/tt2707408/'
                },
                {
                  'title': 'The Witcher',
                  'image': 'assets/images/entertainment/19.jpg',
                  'link': 'https://www.imdb.com/title/tt5180504/'
                },
                {
                  'title': 'Westworld',
                  'image': 'assets/images/entertainment/20.jpg',
                  'link': 'https://www.imdb.com/title/tt0475784/'
                },
              ]),
              const SizedBox(height: 20),
              Center(child: buildSectionTitle(context, 'Novel Recommendations')),
              buildCarousel([
                {
                  'title': 'To Kill a Mockingbird',
                  'image': 'assets/images/entertainment/21.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/_/PGR2AwAAQBAJ?hl=ar&gbpv=0'
                },
                {
                  'title': '1984 by George Orwell',
                  'image': 'assets/images/entertainment/22.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/1984/kotPYEqx7kMC?hl=ar&gbpv=0'
                },
                {
                  'title': 'Pride and Prejudice',
                  'image': 'assets/images/entertainment/23.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/Pride_and_Prejudice/EvqJCGeqKhsC?hl=ar&gbpv=0&bsq=Pride%20and%20Prejudice'
                },
                {
                  'title': 'The Great Gatsby',
                  'image': 'assets/images/entertainment/24.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/The_Great_Gatsby/iWA-DwAAQBAJ?hl=ar&gbpv=0'
                },
                {
                  'title': 'Moby-Dick',
                  'image': 'assets/images/entertainment/25.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/Moby_Dick/cyrMu-gkGQQC?hl=ar&gbpv=0'
                },
                {
                  'title': 'War and Peace',
                  'image': 'assets/images/entertainment/26.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/War_and_Peace/jVMEAAAAYAAJ?hl=ar&gbpv=0'
                },
                {
                  'title': 'The Catcher in the Rye',
                  'image': 'assets/images/entertainment/27.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/Salinger_s_The_Catcher_in_the_Rye/htdSEMt1ZKAC?hl=ar&gbpv=0'
                },
                {
                  'title': 'Brave New World',
                  'image': 'assets/images/entertainment/28.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/Brave_New_World/ZiLvDwAAQBAJ?hl=ar&gbpv=0'
                },
                {
                  'title': 'The Alchemist',
                  'image': 'assets/images/entertainment/29.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/The_Alchemist/6uHQg0YPcScC?hl=ar&gbpv=0'
                },
                {
                  'title': 'The Hobbit',
                  'image': 'assets/images/entertainment/30.jpg',
                  'link':
                  'https://www.google.com.eg/books/edition/The_Hobbit/pD6arNyKyi8C?hl=ar'
                },
              ]),
              const SizedBox(height: 20),
              Center(child: buildSectionTitle(context, 'Music Recommendations')),
              buildCarousel([
                {
                  'title': 'Die With A Smile',
                  'image': 'assets/images/entertainment/31.jpg',
                  'link':
                  'https://open.spotify.com/track/2plbrEY59IikOBgBGLjaoe?si=24b4f138702d4a21'
                },
                {
                  'title': 'Born To Die',
                  'image': 'assets/images/entertainment/32.jpg',
                  'link':
                  'https://open.spotify.com/track/4Ouhoi2lAhrLndQOdWXb1t?si=27c59e299cbf4c5d'
                },
                {
                  'title': 'Old Town Road',
                  'image': 'assets/images/entertainment/33.jpg',
                  'link':
                  'https://open.spotify.com/track/6uC2D3jQQXJ1lEdJ0k3nS4?si=4c1e9b5824904318'
                },
                {
                  'title': 'Halo',
                  'image': 'assets/images/entertainment/34.jpg',
                  'link':
                  'https://open.spotify.com/track/6EefOAKRf4Eu8Ptt65aTUk?si=02b1656c43474f84'
                },
                {
                  'title': 'Someone Like You',
                  'image': 'assets/images/entertainment/35.jpg',
                  'link':
                  'https://open.spotify.com/track/0oTq0m32B4Db8m5MsMjGzU?si=19b70c2c84e84a9e'
                },
                {
                  'title': 'Firework',
                  'image': 'assets/images/entertainment/36.jpg',
                  'link':
                  'https://open.spotify.com/track/5pqYI6MWmlnW0aYUFOVrUs?si=c70862fc410b493e'
                },
                {
                  'title': 'Shape of You',
                  'image': 'assets/images/entertainment/37.jpg',
                  'link':
                  'https://open.spotify.com/track/7qiZQnGQQ5P6wCD4GIk6lL?si=83a9f53dc7bb4d7b'
                },
                {
                  'title': 'Bad Guy',
                  'image': 'assets/images/entertainment/38.jpg',
                  'link':
                  'https://open.spotify.com/track/0ZkvBRgGQ2qP4PfS3tC44v?si=b8b69b4a2dc84767'
                },
                {
                  'title': 'I Will Always Love You',
                  'image': 'assets/images/entertainment/39.jpg',
                  'link':
                  'https://open.spotify.com/track/5zV0p4tDLp4KmH09vU5yBC?si=1a0bde01a2d34056'
                },
                {
                  'title': 'Blinding Lights',
                  'image': 'assets/images/entertainment/40.jpg',
                  'link':
                  'https://open.spotify.com/track/0VTo2h2DoVvQ8g23eXW0RZ?si=32b0e78c2af9419d'
                },
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title.tr(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildCarousel(List<Map<String, String>> items) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 430,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => launchUrl(Uri.parse(item['link']!)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(item['image']!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
