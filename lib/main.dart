import 'package:dating/pages/banks.dart';
import 'package:dating/pages/developer.dart';
import 'package:dating/pages/mnos.dart';
import 'package:dating/pages/splash_screen.dart';
import 'package:dating/pages/utilities_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'UssdZim',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MySplashScreen(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch(selectedIndex){
      case 0 :
        page = MnosPage();
        break;
      case 1 :
        page = BanksPage();
        break;
      case 2 :
        page = UtilitiesPage();
        break;
      case 3 :
        page = DeveloperPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');

    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(




      bottomNavigationBar:  Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: GNav(
            backgroundColor: Colors.black87,
            color: Colors.white,
            tabBackgroundColor: Colors.white10,
            activeColor: Colors.white,
            gap: 8,
            onTabChange: (index){
              setState(() {
                  selectedIndex = index;
                });
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                  icon: Icons.sim_card,
                text: 'MNOs',
              ),
              GButton(
                  icon: Icons.money,
                text: 'Banks',
              ),
              GButton(
                  icon: Icons.devices_other,
                text: 'Utilities',
              ),
              GButton(
                  icon: Icons.info_outline,
                  text: 'Developer',
              ),
            ],

          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: page,
          )
        ],
      ),
    );
  }
}


