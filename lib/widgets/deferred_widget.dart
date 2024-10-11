import 'package:flutter/widgets.dart';

class DeferredWidget extends StatelessWidget {
  const DeferredWidget({required this.future, required this.child, super.key});

  final Future<dynamic> future;
  final Widget child;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return child;
          } else {
            return const SizedBox.shrink(); // Show nothing while loading
          }
        },
      );
}
