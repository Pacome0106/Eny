import 'package:eny/pages/home_page.dart';
import 'package:eny/widgets/app_text.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:eny/widgets/textfield.dart';
import 'package:flutter/material.dart';

import '../widgets/colors.dart';

class Similator extends StatefulWidget {
  const Similator({super.key});

  @override
  State<Similator> createState() => _SimilatorState();
}

class _SimilatorState extends State<Similator> {
  TextEditingController region = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController power = TextEditingController();
  TextEditingController money = TextEditingController();
  TextEditingController i = TextEditingController();

  bool etat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextLarge(
                  text: 'Simulation',
                  color: Theme.of(context).hintColor,
                ),
                sizedbox,
                sizedbox,
                AppText(
                  text:
                      "Inserer vos données pour avoir une idée globale sur le projet auquel vous voules lancer",
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(height: 30),
                AppText(
                  text: 'Region',
                  color: Theme.of(context).hintColor,
                  size: 18,
                ),
                sizedbox,
                textfield(
                  region,
                  context,
                  "nom de la region...",
                  false,
                  "",
                  TextInputType.text,
                ),
                sizedbox,
                sizedbox,
                AppText(
                  text: 'Type de centrale',
                  color: Theme.of(context).hintColor,
                  size: 18,
                ),
                sizedbox,
                textfield(
                  type,
                  context,
                  "type de centrale à installée...",
                  true,
                  'M',
                  TextInputType.text,
                ),
                sizedbox,
                sizedbox,
                AppText(
                  text: 'Puissance installée',
                  color: Theme.of(context).hintColor,
                  size: 18,
                ),
                sizedbox,
                textfield(
                  power,
                  context,
                  "la puissance demandée...",
                  true,
                  'W',
                  TextInputType.text,
                ),
                sizedbox,
                sizedbox,
                AppText(
                  text: "L'argent investie",
                  color: Theme.of(context).hintColor,
                  size: 18,
                ),
                sizedbox,
                textfield(
                  money,
                  context,
                  "la somme du montent investie...",
                  true,
                  '\$',
                  TextInputType.text,
                ),
                const SizedBox(height: 30),
                AppText(
                  text:
                      "Choississez une seule option entre le deux pour avoir une précision exacte",
                  color: Theme.of(context).hintColor,
                ),
                sizedbox,
                sizedbox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppText(
                      text: "Sans interêt",
                      color: !etat
                          ? Theme.of(context).hintColor
                          : Theme.of(context).focusColor,
                      size: 18,
                    ),
                    const SizedBox(),
                    AppText(
                      text: "Avec interêt",
                      color: etat
                          ? Theme.of(context).hintColor
                          : Theme.of(context).focusColor,
                      size: 18,
                    ),
                  ],
                ),
                sizedbox,
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: !etat
                                ? Theme.of(context).hintColor
                                : Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: AppTextLarge(
                          text: "0%",
                          color: !etat
                              ? Theme.of(context).hintColor
                              : Theme.of(context).focusColor,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: etat
                                  ? Theme.of(context).hintColor
                                  : Theme.of(context).focusColor,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 18,
                              right: 10,
                            ),
                            child: TextField(
                              controller: i,
                              cursorColor: Theme.of(context).hintColor,
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 30,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "taux en %",
                                hintStyle: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                ),
                                suffix: AppTextLarge(
                                    text: '%',
                                    color: Theme.of(context).hintColor),
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (String value) {
                                if (value != '') {
                                  setState(() {
                                    etat = true;
                                  });
                                } else {
                                  setState(() {
                                    etat = false;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    color: Colors.black,
                    child: Center(
                      child: AppTextLarge(
                          text: 'Enregistrer', color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textfield(
  controller,
  context,
  String label,
  bool isUnit,
  String unit,
  keyboardType,
) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      borderRadius: borderRadius,
    ),
    child: TextField(
      controller: controller,
      cursorColor: Theme.of(context).hintColor,
      style: TextStyle(
        color: Theme.of(context).hintColor,
        fontSize: 14,
        fontFamily: 'Nunito',
      ),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: 14,
          fontFamily: 'Nunito',
        ),
        contentPadding: const EdgeInsets.only(left: 10, top: 5),
        border: InputBorder.none,
        focusColor: AppColors.menuColor,
        prefixIcon: isUnit
            ? Container(
                height: 50,
                width: 60,
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Theme.of(context).focusColor,
                ),
                child: Center(
                  child: AppTextLarge(
                    text: unit,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).focusColor, width: 2),
          borderRadius: borderRadius,
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).focusColor, width: 2),
          borderRadius: borderRadius,
          gapPadding: 0,
        ),
      ),
      keyboardType: keyboardType,
    ),
  );
}
