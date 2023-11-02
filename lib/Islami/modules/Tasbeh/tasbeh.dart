// import 'package:flutter/material.dart';
//
// class TasbehView extends StatefulWidget {
//   const TasbehView({super.key});
//
//   @override
//   State<TasbehView> createState() => _TasbehViewState();
// }
//
// var changeText = 0.0;
//
// class _TasbehViewState extends State<TasbehView> {
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return Column(
//       children: [
//         const SizedBox(
//           height: 20,
//         ),
//         Image.asset("assets/images/sabha.png", height: 250),
//         const SizedBox(
//           height: 40,
//         ),
//         Text(
//           "عدد التسبيحات",
//           style: theme.textTheme.bodyMedium,
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Container(
//           padding: const EdgeInsets.all(10.0), //
//           decoration: BoxDecoration(
//             color: theme.primaryColor.withOpacity(.6),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Text(
//             '$counter',
//             style: const TextStyle(fontSize: 50, color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 40.0),
//         GestureDetector(
//           onTap: () {
//             incrementCounter();
//             changeText += 1 / 33;
//           },
//           child: Container(
//             width: 137,
//             height: 51,
//             decoration: BoxDecoration(
//               color: theme.colorScheme.onPrimary,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             alignment: Alignment.center,
//             child: Text(tsbeh[index],
//                 style: const TextStyle(
//                   fontSize: 25,
//                   color: Colors.black,
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
//
//
//
//   int counter = 0;
//   int index = 0;
//
//   List<String> tsbeh = [
//     "سبحان الله",
//     "الحمدلله",
//     "الله اكبر",
//     "لا إله إلا الله"
//   ];
//
//
//   incrementCounter() {
//     setState(() {
//       counter++;
//       if (index == 0 && counter == 33) {
//         index = 1;
//         counter = 0;
//       } else if (index == 1 && counter == 33) {
//         index = 2;
//         counter = 0;
//       } else if (index == 2 && counter == 33) {
//         index = 3;
//         counter = 0;
//       } else if (index == 3 && counter == 33) {
//         index = 0;
//         counter = 0;
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:islami_app/Islami/Core/Provider/app_provider.dart';
import 'package:provider/provider.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  List<String> text = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
    "لا إله إلا الله"
  ];

  @override
  int counter = 0;
  double angle = 0;
  int currentIndex = 0;

  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
                margin: EdgeInsets.only(left: 40, top: 10),
                child: Image.asset(
                  appProvider.isDarkEnabled()
                      ? "assets/images/sebha_head_dark.png"
                      : "assets/images/sebha_head.png",
                  height: 120,
                  width: mediaQuery.width * 0.99999999,
                )),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Transform.rotate(
                  angle: angle,
                  child: Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent),
                    child: InkWell(
                        onTap: () {
                          onButtonClicked();
                          angle += 5;
                          setState(() {});
                        },
                        child: Image.asset(
                          appProvider.isDarkEnabled()
                              ? "assets/images/sebha_body_dark.png"
                              : "assets/images/body_sebha.png",
                          height: 200,
                          width: mediaQuery.width * 0.99999999,
                        )),
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "عدد التسبيحات",
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          height: 81,
          width: 69,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: theme.primaryColor.withOpacity(.6),
          ),
          child: Text(
            "${counter}",
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
            alignment: Alignment.center,
            height: 51,
            width: 137,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: theme.colorScheme.onPrimary),
            child: Text(
              text[currentIndex],
              style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
            )),
      ],
    );
  }

  void onButtonClicked() {
    if (counter == 33) {
      counter = 0;
      currentIndex++;
      currentIndex = currentIndex % 3;
    }
    counter++;
    setState(() {});
  }
}
