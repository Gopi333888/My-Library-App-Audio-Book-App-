import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/InnerScreens/aboutBook.dart';
import 'package:mylibrary/Screens/Models/bookdataModel.dart';
import 'package:mylibrary/Screens/login.dart/UserLogin.dart';
import 'package:mylibrary/Screens/service/auth_service.dart';
import 'package:mylibrary/Screens/service/hivedatabase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<BookModel> bookDatas = [];

const dividers = SizedBox(
  height: 20,
);

class _HomeScreenState extends State<HomeScreen> {
  Future<void> fetchBookData() async {
    List<BookModel> booksdata = await getdata();
    setState(() {
      bookDatas = booksdata;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBookData();
  }

  AuthService authservice = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "My Library",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListTile(
            leading: InkWell(
              //inkwell or guestordirector can be used
              onTap: () {
                authservice.signOut();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("LogOut"),
                      content: const Text("Log Out of your account"),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ElevatedButton(
                              onPressed: () {
                                authservice.signOut();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const UserLogin(),
                                    ),
                                    (route) => false);
                              },
                              child: const Text("Log out")),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel"))
                      ],
                    );
                  },
                );
              },
              child: const Text(
                "LogOut",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dividers,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Top Books",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          bookDatas.isEmpty
              ? const Text("Books Data is not Available")
              : Expanded(
                  child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.5,
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: bookDatas.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // showSelectedImageDialog(
                            //     context, bookDatas[index].imageUrl);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutBookScreen(
                                        bookmodel: bookDatas[index])));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.file(
                              File(
                                (bookDatas[index].imageUrl),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                )),
        ],
      ),
    );
  }
}
