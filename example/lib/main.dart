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
      title: 'Flutter Demo',
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
    const ColoredBox(color: Colors.blueGrey),
    const ColoredBox(color: Colors.greenAccent),
    const ColoredBox(color: Colors.yellowAccent),
    const ColoredBox(color: Colors.black12),
    const ColoredBox(color: Colors.black12),
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
      appBar: AppBar(
        title: const Text('Svg Bottom Bar'),
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
                  activeWidget: Image.asset(
                    'assets/account_grey_unselected_button2.png',
                    height: 20,
                    width: 20,
                    color: Colors.redAccent,
                  ),
                  label: 'Page 3',
                ),
                BottomBarItemModel(
                  inActiveWidget: Image.asset(
                    'assets/account_grey_unselected_button2.png',
                    height: 20,
                    width: 20,
                  ),
                  activeWidget: SvgPicture.asset(
                    'assets/ic_quick_guide.svg',
                    height: 20,
                    width: 20,
                    color: Colors.redAccent,
                  ),
                  label: 'Page 3',
                ),
                BottomBarItemModel(
                  inActiveWidget: SvgPicture.asset(
                    'assets/ic_verify_sign.svg',
                    height: 20,
                    width: 20,
                  ),
                  activeWidget: SvgPicture.asset(
                    'assets/ic_verify_sign.svg',
                    height: 20,
                    width: 20,
                    color: Colors.greenAccent,
                  ),
                  label: 'Page 4',
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
