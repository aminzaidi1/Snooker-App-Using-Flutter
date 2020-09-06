import 'package:flutter/material.dart';
import 'package:responsive_ui/exported.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _MobileLayout(),
      tablet: OrientationLayout(
        portrait: const _TabletPortrait(),
        landscape: const _TabletLandscape(),
      ),
    );
  }

  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Images',
        iconData: Icons.image,
      ),
      DrawerOption(
        title: 'Reports',
        iconData: Icons.photo_filter,
      ),
      DrawerOption(
        title: 'Incidents',
        iconData: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
      ),
    ];
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 250 : 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: orientation == Orientation.landscape?
        MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
        children: AppDrawer.getDrawerOptions(),
      ),
    );
  }
}

class _TabletPortrait extends StatelessWidget {
  const _TabletPortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black12),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: AppDrawer.getDrawerOptions(),
      ),
    );
  }
}

class _TabletLandscape extends StatelessWidget {
  const _TabletLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black12),
        ],
      ),
      child: Column(
        children: AppDrawer.getDrawerOptions(),
      ),
    );
  }
}