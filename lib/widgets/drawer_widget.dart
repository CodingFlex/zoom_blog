import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
        child: Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    'assets/images/newspaper.png',
                    // height: 60,
                    // width: 60,
                  ),
                ),
                Gap(20),
                Flexible(
                  child: Text('News app'),
                )
              ],
            ),
          ),
          Gap(20),
          listTiles(
            label: "Home",
            icon: IconlyBold.home,
            fct: () {},
          ),
          listTiles(
            label: "Bookmarks",
            icon: IconlyBold.bookmark,
            fct: () {},
          ),
          Divider(
            thickness: 5,
          ),
          SwitchListTile(
              title: Text(
                themeProvider.getDarkTheme ? 'Dark' : 'Light',
                style: TextStyle(fontSize: 20),
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: themeProvider.getDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              }),
        ],
      ),
    ));
  }
}

class listTiles extends StatelessWidget {
  const listTiles({
    super.key,
    required this.label,
    required this.fct,
    required this.icon,
  });
  final String label;
  final Function fct;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        fct();
      },
    );
  }
}
