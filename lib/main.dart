import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello from flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const platform = MethodChannel('com.example.app/open');
  late TextEditingController _controller;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }




  Future<void> openScreen() async {
    if(_key.currentState!.validate()){
      try {
        await platform.invokeMethod('open', _controller.text);
      } catch (e) {
        debugPrint('$e');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D19FA),
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               TextFormField(
                 controller: _controller,
                 decoration: InputDecoration(
                   hintText: 'Message'
                 ),
                 validator: (v){
                   if(v != null && v.isEmpty){
                     return 'empty field';
                   }
                   return null;
                 },
               )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openScreen,
        tooltip: 'OpenScreen',
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
