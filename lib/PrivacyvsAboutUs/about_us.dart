import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AboutUs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("About Us"),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to My Library!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              "Discover the World of Audiobooks",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              "My Library is not just an app; it's your gateway to a world of captivating stories brought to life through the magic of audiobooks. Immerse yourself in the joy of literature, whether you're at home, commuting, or relaxing on the go.",
            ),
            SizedBox(height: 16.0),
            Text(
              "Key Features:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                "📚 Audiobook Library: Explore a vast collection of audiobooks."),
            Text("🎧 Listen Anytime, Anywhere: Enjoy stories on the go."),
            Text("📂 Categories: Easily find books by genre or interest."),
            Text("❤️ Favorites: Save your beloved books for quick access."),
            Text("🔍 Search: Find your next adventure quickly and accurately."),
            Text("📖 Book Descriptions: Get to know the story and the author."),
            SizedBox(height: 16.0),
            Text(
              "How to Use:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "1. Explore Categories: Browse books by genre or explore new interests.",
            ),
            Text(
              "2. Favorites: Mark your favorite books for easy access later.",
            ),
            Text(
              "3. Search: Find specific books or authors with our fast search feature.",
            ),
            Text(
              "4. Descriptions: Get detailed insights into each book and its author.",
            ),
            Text(
              "5. Listen: Enjoy a seamless listening experience with our audiobooks.",
            ),
            SizedBox(height: 16.0),
            Text(
              "Thank you for choosing My Library. Happy listening!",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
