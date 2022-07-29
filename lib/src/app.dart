import 'package:flutter/material.dart';
import 'package:flutter_state_restoration/src/home_page.dart';
import 'package:flutter_state_restoration/src/second_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Restoration',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      restorationScopeId: "app", // Root restoration scope
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == "/second") {
          return MaterialPageRoute(builder: (context) {
            // Arguments object can't be a custom class, it needs to a "primitive type" (Int, Bool, String, Map, List...)
            final arguments = routeSettings.arguments as Map;
            final title = arguments["title"] as String;

            return SecondPage(title: title);
          });
        }
        return MaterialPageRoute(builder: (context) {
          return const Placeholder();
        });
      },
    );
  }
}
