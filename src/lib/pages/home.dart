import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final double pageHeight = 1000.0;
  final portfolioIconPath = 'assets/icons/portfolio-icon.svg';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: false,
            centerTitle: false,
            forceMaterialTransparency: true,
            leading: IconButton(
              icon: SvgPicture.asset(widget.portfolioIconPath),
              onPressed: () {},
            ),
            title: Text(widget.title),
            actions: [
              TextButton(
                child: const Text('About Me'),
                style: TextButton.styleFrom(
                  textStyle: textTheme.titleMedium?.copyWith(color: null),
                ),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Projects'),
                style: TextButton.styleFrom(
                  textStyle: textTheme.titleMedium?.copyWith(color: null),
                ),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Research'),
                style: TextButton.styleFrom(
                  textStyle: textTheme.titleMedium?.copyWith(color: null),
                ),
                onPressed: () {},
              ),

            ],
            // expandedHeight: 200,
            // flexibleSpace: const FlexibleSpaceBar(
            //   title: Text('SliverAppBar'),
            //   background: FlutterLogo(),
            // ),
          ),
          SliverFixedExtentList(
            itemExtent: widget.pageHeight,
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: widget.pageHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '$_counter',
                        style: textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
