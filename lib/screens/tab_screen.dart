import 'package:fatafat_delivery/constants/constants.dart';
import 'package:fatafat_delivery/screens/camera/main.dart';
import 'package:fatafat_delivery/screens/main_page2.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static const String idScreen = "tabScreen";
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int selectedIndex = 0;

  void onItemClick(int index) {
    selectedIndex = index;
    tabController.index = selectedIndex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            HomePage(),
            CameraScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt), label: "Click a Picture")
          ],
          unselectedItemColor: Constants.PRIMARY_COLOR,
          selectedItemColor: Constants.PRIMARY_ACCENT,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 12),
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: onItemClick,
          backgroundColor: Constants.SECONDARY_COLOR,
        ));
  }
}
