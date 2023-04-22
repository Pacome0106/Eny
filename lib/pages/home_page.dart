// ignore_for_file: must_be_immutable, avoid_print, body_might_complete_normally_catch_error, deprecated_member_use, depend_on_referenced_packages

import 'package:eny/pages/accueil.dart';
import 'package:eny/pages/similator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    final tabs = [
      const Acceuil(),
      const Similator(),
    ];
    return Scaffold(
      body: SafeArea(
        child: tabs[widget.currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).backgroundColor,
        selectedIconTheme:
            IconThemeData(color: Theme.of(context).bottomAppBarColor, size: 30),
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).hoverColor, size: 25),
        currentIndex: widget.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.church),
            label: 'Acceuil',
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.timeline_sharp),
            label: 'Similateur',
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
      ),
    );
  }
}
