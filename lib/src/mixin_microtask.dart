import 'package:flutter/widgets.dart';

/// Mixin to handle microtask.
mixin MicroTaskMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    Future.microtask(() => microtask(context));
    super.initState();
  }

  /// microtask to call in init state
  @mustCallSuper
  void microtask(BuildContext context);
}
