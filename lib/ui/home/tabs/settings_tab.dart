import 'package:flutter/material.dart';
import 'package:muslim_app/providers/settings_providers.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';
import 'package:muslim_app/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  bool darkModeSwitch = false;
  late SettingsProviders providers;

  @override
  Widget build(BuildContext context) {
    providers =Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.bodyMedium),
          buildSettingsRow("العربية", arSwitch, (newValue){
            arSwitch = newValue;
            if(arSwitch){
              providers.setCurrentLocale("ar");
            }else{
              providers.setCurrentLocale("en");
            }
          }),
          buildSettingsRow(AppLocalizations.of(context)!.darkMode, darkModeSwitch, (newValue){
            darkModeSwitch = newValue;
           if(darkModeSwitch){
             providers.setCurrentMode(ThemeMode.dark);
           }else{
             providers.setCurrentMode(ThemeMode.light);
           }
          }),
        ],
      ),
    );
  }

  Widget buildSettingsRow(String title,bool switchValue,Function(bool) onChanged){
    return Row(
      children: [
        SizedBox(width: 16,),
        Text(title,style: Theme.of(context).textTheme.bodySmall),
        Spacer(),
        Switch(value: switchValue, onChanged: onChanged,activeColor: AppColors.primary,),
      ],
    );
  }
}
