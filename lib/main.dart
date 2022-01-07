import 'package:flutter/material.dart';
import 'package:mosallas/pages/login/splash.dart';
import 'package:mosallas/state_management/bottom_sheet_listview_provider.dart';
import 'package:mosallas/state_management/timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomSheetListviewProvider>(create: (_) => BottomSheetListviewProvider()),
        ChangeNotifierProvider<TimerProvider>(create: (_) => TimerProvider()),
      ],
      child: MaterialApp(
        title: 'Mosallas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
        // routes: <String, WidgetBuilder>{
        //   '/': (_) => Splash(),
        //   '/splash': (_) => Splash(),
        // },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
