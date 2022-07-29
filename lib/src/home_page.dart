import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  late RestorableRouteFuture _secondPageRoute;

  @override
  void initState() {
    super.initState();

    // When expecting some result, instantiate a RestorableRouteFuture
    _secondPageRoute =
        RestorableRouteFuture(onPresent: (NavigatorState navigator, Object? arguments) {
      // Use a "restorable" method from navigator to enable state restoration
      return navigator.restorablePushNamed(
        "/second",
        arguments: arguments,
      );
    }, onComplete: (Object? result) {
      showSnackBar(ScaffoldMessenger.of(context), result.toString());
    });
  }

  void showSnackBar(ScaffoldMessengerState scaffoldMessengerState, String result) {
    scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: Text("Result: $result"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter State Restoration"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);

                final result = await Navigator.of(context).pushNamed(
                  "/second",
                  arguments: {"title": "Without State Restoration"},
                );

                showSnackBar(scaffoldMessenger, result.toString());
              },
              child: const Text("Without state restoration"),
            ),
            OutlinedButton(
              onPressed: () {
                _secondPageRoute.present({"title": "With State Restoration"});
              },
              child: const Text("With state restoration"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String? get restorationId => "home_page";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_secondPageRoute, "second_page_route");
  }
}
