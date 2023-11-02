import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Islami//modules/Quran/quran_view.dart';
import 'package:provider/provider.dart';

import '../../Core/Provider/app_provider.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "Quran_Details_View";

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  String content = "";
  List<String> allVerses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetails;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    if (content.isEmpty) {
      readFiles(args.suraNumber);
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(appProvider.getBackgroundImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 120),
          width: mediaQuery.width,
          height: mediaQuery.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onBackground.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة${args.suraName}",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                  Icon(
                    Icons.play_circle,
                    size: 32,
                    color: theme.colorScheme.onSecondary,
                  )
                ],
              ),
              const Divider(
                indent: 30,
                endIndent: 30,
                thickness: 1.2,
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    "${allVerses[index]} (${index + 1})",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSecondary,
                      height: 1.8,
                    ),
                  ),
                  itemCount: allVerses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  readFiles(String index) async {
    String text = await rootBundle.loadString("assets/files/$index.txt");
    content = text;
    setState(() {
      allVerses = content.split("\n");
    });
  }
}
