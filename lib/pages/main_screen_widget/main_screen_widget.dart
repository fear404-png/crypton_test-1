import 'package:crypton_test/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static final List<Widget> _widgetsList = [
    Center(
        child: Text(
      "news",
    )),
    Center(child: Text("page 2")),
    Center(child: Text("page 3")),
    Center(child: Text("page 4")),
    Center(child: Text("page 5")),
  ];

  _onTap(int index) {
    if (index == _selectedTab) return;
    setState(() {
      _selectedTab = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainScreenBackground,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.mainScreenDefault),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps_outlined), label: "Name"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Name"),
            BottomNavigationBarItem(
                icon: Icon(Icons.workspaces_outline), label: "Name"),
            BottomNavigationBarItem(icon: Icon(Icons.gpp_good), label: "Name"),
          ],
          currentIndex: _selectedTab,
          onTap: _onTap,
        ),
        body: _widgetsList[_selectedTab],
      ),
    );
  }
}
