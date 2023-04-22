import 'package:eny/widgets/app_text_large.dart';
import 'package:flutter/material.dart';

class Similator extends StatefulWidget {
  const Similator({super.key});

  @override
  State<Similator> createState() => _SimilatorState();
}

class _SimilatorState extends State<Similator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: double.maxFinite,
              height: 350,
               child: AppTextLarge(
                    text: 'Nouvelles Donnees', color: Colors.black, size: 18),
              

            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.maxFinite,
              height: 50,
              color: Colors.black,
              child: Center(
                child: AppTextLarge(
                    text: 'Enregistrer', color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
