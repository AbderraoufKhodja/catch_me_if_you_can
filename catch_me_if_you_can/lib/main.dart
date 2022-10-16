import 'package:catch_me_if_you_can/opened_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Size get _size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade200,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const OpenedMenuPage())),
              );
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Image.asset(
        'assets/WeChat Image_20221014160549.jpg',
        height: _size.height,
        width: _size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
