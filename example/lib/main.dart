import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar_src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated Notch Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView
  final _pageController = PageController();

  int maxCount = 5;

  /// widget list
  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];
  final List<BottomBarItems> _bottomBarItemsList = [
    const BottomBarItems(
      inActiveItem: Icon(
        Icons.home_filled,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.home_filled,
        color: Colors.blueAccent,
      ),
      itemLabel: 'Page 1',
    ),
    const BottomBarItems(
      inActiveItem: Icon(
        Icons.star,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.star,
        color: Colors.blueAccent,
      ),
      itemLabel: 'Page 2',
    ),

    ///svg example
    BottomBarItems(
      inActiveItem: SvgPicture.asset(
        'assets/search_icon.svg',
        color: Colors.blueGrey,
      ),
      activeItem: SvgPicture.asset(
        'assets/search_icon.svg',
        color: Colors.black,
      ),
      itemLabel: 'Page 3',
    ),
    const BottomBarItems(
      inActiveItem: Icon(
        Icons.settings,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.settings,
        color: Colors.pink,
      ),
      itemLabel: 'Page 4',
    ),
    const BottomBarItems(
      inActiveItem: Icon(
        Icons.person,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.person,
        color: Colors.yellow,
      ),
      itemLabel: 'Page 5',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Animated Notch Bottom Bar'),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? NotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              bottomBarItems: List.generate(
                  bottomBarPages.length, (index) => _bottomBarItemsList[index]),
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 1'));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 2'));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 3'));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 4'));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 5'));
  }
}
