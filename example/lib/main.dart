import 'package:flutter/material.dart';
import 'package:flutter_adaptive_drawer/flutter_adaptive_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveDrawerScaffold(
      scaffoldBuilder: (
        context, {
        required child,
        required drawer,
        required isSmallScreen,
      }) =>
          Scaffold(
        drawer: drawer,
        appBar: isSmallScreen ? AppBar() : null,
        body: child,
      ),
      drawer: AdaptiveDrawer(
        mainChildren: [
          AdaptiveDrawerItem(
            collapsedBuilder: (context) {
              return const Icon(Icons.home);
            },
            expandedBuilder: (context) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Home'),
                ],
              );
            },
          ),
        ],
      ),
      child: const Placeholder(),
    );
  }
}
