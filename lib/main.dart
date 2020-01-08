import 'package:flutter/material.dart';
import './screens/home.screen.dart';
import 'package:admob_flutter/admob_flutter.dart';
import './helpers/getIDAdMob.helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize(getAppId());
  runApp(Index());
}

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan a Party',
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(), initialRoute: Home.id, routes: {
      Home.id: (context) => Home(),
    });
  }
}
