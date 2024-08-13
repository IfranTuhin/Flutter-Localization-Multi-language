import 'package:flutter/material.dart';
import 'package:flutter_localization_multi_language/main.dart';
import 'package:flutter_localization_multi_language/services/language/language.dart';
import 'package:flutter_localization_multi_language/services/language/language_constants.dart';
import 'package:flutter_localization_multi_language/services/router/route_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).homeScreen, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        actions: [
          _languageButton(),
        ],
      ),
      drawer: Drawer(
        child: _customDrawer(context: context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
          
                // Main form
                _mainForm(context),
          
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------- Language button  Start ----------
  Padding _languageButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      child: DropdownButton<Language>(
        underline: const SizedBox(),
        icon: const Icon(
          Icons.language,
          size: 30,
        ),
        onChanged: (Language? language) async {
          if(language != null) {
            Locale _locale = await setLocale(language.languageCode);
            MyApp.setLocale(context, _locale);
          }
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(e.flag, style: const TextStyle(fontSize: 20)),
                    Text(e.name)
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // ---------- Language button End ----------
  Container _customDrawer({required BuildContext context}) {
    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: SizedBox(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.white, size: 26),
            title: Text(translation(context).aboutUs, style: textStyle),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, RouteConstants.aboutScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white, size: 26),
            title: Text(translation(context).settings, style: textStyle),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, RouteConstants.settingScreen);
            },
          ),
        ],
      ),
    );
  }
  // ---------- Custom drawer End ----------

  // ---------- Mani Form start  ----------
  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                translation(context).personalInformation,
                textAlign: TextAlign.center,
                style:const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return "Required Field";
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
              hintText: "Please enter name",
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return "Required Field";
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
              hintText: "Please enter email",
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Date of Birth",
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 20),
              );
            },
          ),
          const SizedBox(height: 40),
          MaterialButton(
            onPressed: () {
              if (_key.currentState != null && _key.currentState!.validate()) {
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: const StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child:  Center(
              child: Text(AppLocalizations.of(context)!.submitInfo, style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
  // ---------- Mani Form End  ----------

  // Show success dialog
  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
