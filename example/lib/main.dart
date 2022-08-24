import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar_src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  final _controller = PageController();
  int maxCount = 5;
  List<Widget> tabBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  @override
  void dispose() {
    _controller.dispose();
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
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(maxCount, (index) => tabBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (tabBarPages.length <= maxCount)
          ? NotchBottomBar(
              controller: _controller,
              items: [
                const BottomBarItemModel(
                  inActiveWidget: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeWidget: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  label: 'Page 1',
                ),
                const BottomBarItemModel(
                  inActiveWidget: Icon(
                    Icons.star,
                  ),
                  activeWidget: Icon(
                    Icons.star,
                    color: Colors.blueAccent,
                  ),
                  label: 'Page 2',
                ),
                BottomBarItemModel(
                  inActiveWidget: SvgPicture.asset(
                    'assets/search_icon.svg',
                    height: 20,
                    width: 20,
                  ),
                  activeWidget: SvgPicture.asset(
                    'assets/search_icon.svg',
                    height: 20,
                    width: 20,
                  ),
                  label: 'Page 1',
                ),
                const BottomBarItemModel(
                  inActiveWidget: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  activeWidget: Icon(
                    Icons.settings,
                    color: Colors.pink,
                  ),
                  label: 'Page 4',
                ),
                const BottomBarItemModel(
                  inActiveWidget: Icon(
                    Icons.person,
                  ),
                  activeWidget: Icon(
                    Icons.person,
                    color: Colors.yellowAccent,
                  ),
                  label: 'Page 5',
                ),
              ],
              onTap: (index) {
                _controller.animateToPage(
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
