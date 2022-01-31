import 'package:flutter/material.dart';

class ProviderCustomPage extends StatefulWidget {
  const ProviderCustomPage({Key? key}) : super(key: key);

  @override
  _ProviderCustomPageState createState() => _ProviderCustomPageState();
}

class _ProviderCustomPageState extends State<ProviderCustomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: const Text("Hello, i'm provider")),
    );
  }
}
