import 'package:flutter/material.dart';

class BlocCustomPage extends StatefulWidget {
  const BlocCustomPage({Key? key}) : super(key: key);

  @override
  _BlocCustomPageState createState() => _BlocCustomPageState();
}

class _BlocCustomPageState extends State<BlocCustomPage> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)?.settings.arguments;
    print("arrrg");
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Container(
          alignment: Alignment.center, child: const Text("Hello, i'm bloc")),
    );
  }
}
