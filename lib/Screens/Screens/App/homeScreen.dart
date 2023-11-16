import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

final CollectionReference userReference =
    FirebaseFirestore.instance.collection('users');
String name = "";
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
          child: Column(
            children: [
              ListTile(
                leading: InkWell(
                  //inkwell or guestordirector can be used
                  onTap: () {
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
                                          builder: (context) =>
                                              const UserLogin(),
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
              StreamBuilder(
                stream: userReference
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic>? data =
                        snapshot.data!.data() as Map<String, dynamic>?;

                    if (data != null && data.containsKey('fullName')) {
                      name = data['fullName'] as String;
                    }

                    return UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 116, 196, 220),
                      ),
                      accountName: DateTime.now().hour < 12
                          ? Text('Good Morning $name')
                          : DateTime.now().hour >= 12 &&
                                  DateTime.now().hour < 16
                              ? Text('Good Afternoon $name')
                              : Text('Good Evening $name'),
                      accountEmail:
                          Text(FirebaseAuth.instance.currentUser!.email!),
                    );
                  }

                  // Handle other cases or return a placeholder widget
                  return const Text('Loading...');
                },
              )
            ],
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
                              mainAxisSpacing: 18,
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
                                          bookModel: bookDatas[index],
                                        )));
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
