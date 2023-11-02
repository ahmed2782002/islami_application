import 'package:flutter/material.dart';
import 'package:islami_app/Islami/Core/Provider/app_provider.dart';
import 'package:islami_app/Islami/modules/Settings/Widget/selected_option_widget.dart';
import 'package:islami_app/Islami/modules/Settings/Widget/unselected_option_widget.dart';
import 'package:provider/provider.dart';

class LanguageBottom extends StatelessWidget {
  const LanguageBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                appProvider.changeLocal("en");
                Navigator.pop(context);
              },
              //If I choose English, I show English, or if I don't select English, I don't show it
              child: appProvider.currentLocale == "en"
                  ? const SelectedOption(
                      selectedTitle: "English",
                    )
                  : const UnSelectedOption(titleUnselectedOption: "English")),
          const SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                appProvider.changeLocal("ar");
                Navigator.pop(context);
              },
              child: appProvider.currentLocale == "ar"
                  ? const SelectedOption(
                      selectedTitle: "العربيه",
                    )
                  : const UnSelectedOption(titleUnselectedOption: "العربيه"))
        ],
      ),
    );
  }
}
/*

 */
