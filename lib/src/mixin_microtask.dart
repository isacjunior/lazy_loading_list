import 'package:flutter/widgets.dart';

mixin MicroTaskMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    Future.microtask(() => microtask(context));
    super.initState();
  }

  @mustCallSuper
  void microtask(BuildContext context);
}
