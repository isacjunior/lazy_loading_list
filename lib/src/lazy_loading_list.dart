import 'package:flutter/widgets.dart';
import 'package:lazy_loading_list/src/mixin_microtask.dart';

class LazyLoadingListView extends StatefulWidget {
  final Function loadMore;
  final Widget child;
  final int index;
  final bool hasMore;
  final int initialSizeOfItems;

  const LazyLoadingListView({
    Key key,
    @required this.loadMore,
    @required this.child,
    @required this.index,
    @required this.hasMore,
    this.initialSizeOfItems = 10,
  }) : super(key: key);

  @override
  LazyLoadingListViewState createState() => LazyLoadingListViewState();
}

class LazyLoadingListViewState extends State<LazyLoadingListView>
    with MicroTaskMixin<LazyLoadingListView> {
  Future<void> _handleLoadMore() async {
    final itemPosition = widget.index + 1;
    final passedMoreThreshold = itemPosition % widget.initialSizeOfItems == 0;
    if (passedMoreThreshold && widget.hasMore) {
      await widget.loadMore();
    }
  }

  @override
  void microtask(BuildContext context) {
    _handleLoadMore();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
