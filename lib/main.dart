import 'package:flutter/material.dart';
import 'package:goode_notes/models/color_theme_data.dart';
import 'models/items_data.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createSharedPrefObject();
  await ItemsData().createSharedPrefObject();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ItemsData>(
        create: (BuildContext context) => ItemsData(),
      ),
      ChangeNotifierProvider<ColorThemeData>(
        create: (BuildContext context) => ColorThemeData(),
      ),
    ], child: GoodeNotes()),
  );
}

class GoodeNotes extends StatelessWidget {
  const GoodeNotes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer2<ItemsData, ColorThemeData>(
        builder: (context, itemData, colorThemeData, child) {
      itemData.loadItemsFromSharedPref();
      colorThemeData.loadThemeFromSharedPref();
      return MaterialApp(
        title: 'Goode Notes',
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ColorThemeData>(context).selectedTheme,
        home: SplasWidget(),
      );
    });
  }
}
