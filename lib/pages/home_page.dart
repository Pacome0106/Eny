// ignore_for_file: must_be_immutable, avoid_print, body_might_complete_normally_catch_error, deprecated_member_use, depend_on_referenced_packages

import 'package:eny/pages/accueil.dart';
import 'package:eny/pages/similator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/app_text_large.dart';

BorderRadius borderRadius = BorderRadius.circular(10);
SizedBox sizedbox = const SizedBox(height: 10);
SizedBox sizedbox2 = const SizedBox(width: 10);

class HomePage extends StatefulWidget {
  HomePage({super.key, this.currentIndex = 0});
  int currentIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List user = [];
  Map<String, dynamic>? userData;

  // Future getUser2() async {
  //   var date = DateTime.now();
  //   String dateFormat = DateFormat('EEEE').format(date);
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(theuser!.uid)
  //       .get()
  //       .then((value) {
  //     userData = value.data();
  //   });
  //   if (userData != null) {
  //     final databaseReference = FirebaseDatabase.instance.reference();
  //     databaseReference
  //         .child('activity')
  //         .child(userData!['church'])
  //         .child(dateFormat)
  //         .child(theuser!.uid)
  //         .set({
  //           'uid': theuser!.uid,
  //         })
  //         .then((value) => {print("active")})
  //         .catchError((error) {
  //           print(error.toString());
  //         });
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() => userData);
  //   }
  // }

  testConnexion() async {
    await FirebaseAuth.instance.signOut();
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   //mobil connexion
    //   // getUser2();
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   //wifi connexion
    //   // getUser2();
    // } else {
    //   // ignore: use_build_context_synchronously
    //   notification(context, 'Pas de connexion internet', 50);
    // }
  }

  bool isUser = false;
  int coumpt = 0;
  @override
  void dispose() {
    // getUser();
    super.dispose();
  }

  @override
  void initState() {
    // testConnexion();
    // theuser != null ? testConnexion() : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (coumpt < 1) {
    //   getUser();
    //   coumpt++;
    // }

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            const TabBarView(
              children: [
                Acceuil(),
                Similator(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      offset: Offset(1, 4), // Shadow position
                    ),
                  ],
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: ClipPath(
                  clipper: const ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    mouseCursor: MouseCursor.uncontrolled,
                    indicatorColor: Theme.of(context).hintColor,
                    labelColor: Theme.of(context).hintColor,
                    unselectedLabelColor: Theme.of(context).hoverColor,
                    tabs: const [
                      Tab(child: Icon(Icons.home, size: 35)),
                      Tab(child: Icon(Icons.timeline_sharp, size: 35)),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
