import 'package:flutter/material.dart';
import 'package:imagedragdrop2/Pages/dargdropPage.dart';
import 'package:imagedragdrop2/Pages/explore.dart';
import 'package:imagedragdrop2/Pages/wardrobepage.dart';
import 'package:imagedragdrop2/Pages/profilepage.dart';
import 'package:imagedragdrop2/Pages/tryonpage.dart';
import 'package:imagedragdrop2/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  List<Widget> pageWidgets = [
    const DragdropPage(),
    const Wardrobepage(),
    const Tryonpage(),
    const Explorepage(),
    const Profilepage()
    
    
  ];

  void onBottomTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      
      body: Container(
        child: pageWidgets[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edit_calendar,
                size: 20,
              ),
              label: "Plan"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.checkroom_rounded,
                size: 20,
              ),
              label: "WarDrobe"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.change_circle,
                size: 20,
              ),
              label: "Try on"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                size: 20,
              ),
              label: "Explore"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 20,
              ),
              label: "Profile"),
        ],
        currentIndex: _pageIndex,
        onTap: onBottomTap,
      ),
    );
  }
}
