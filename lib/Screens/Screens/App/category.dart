import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/Screens/Screens/book_sorted.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<List<String>> categories = [
    ['Adventure', 'assets/images/Adventure 1.jpg'],
    ['Fantasy', 'assets/images/Fantasy 1.jpeg'],
    ['Science Fiction', 'assets/images/SFiction.jpg'],
    ['Travel', 'assets/images/Travel.jpg'],
    ['Romance', 'assets/images/Romance.jpeg'],
    ['Novel', 'assets/images/Novels.jpeg'],
    ['Horror', 'assets/images/horror2.jpg'],
    ['Humor', 'assets/images/Humor2.jpg'],
    ['Thriller', 'assets/images/TrillerBooks.jpg'],
    ['War story', 'assets/images/WarBooks.jpg'],
    ['Mystery', 'assets/images/Mystry.jpg'],
    ['Classics', 'assets/images/classicBooks2.jpg'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 0,
          childAspectRatio: 1 / 0.70,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String categoryName = categories[index][0];
          String imagePath = categories[index].length > 1
              ? categories[index][1]
              : 'assets/images/default_image.jpg'; // Provide a default image path

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenBookSorted(category: categoryName),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 98, left: 7),
                    child: Text(categoryName,
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.7))),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
