import 'package:flutter/widgets.dart';
import 'package:lazy_loading_list/src/mixin_microtask.dart';

/// Widget to loading more itens in your list.
class LazyLoadingList extends StatefulWidget {
  /// Function to incresent more itens in your items.
  final Function loadMore;

  /// Child to build.
  final Widget child;

  /// Index of items.
  final int index;

  /// Boolean value to control if has more itens to fetch.
  final bool hasMore;

  /// This value is initial value of size the items builded in the first build.
  final int initialSizeOfItems;

  /// Lazy loading Widget to load more items by the index of the item
  /// to increment you a list like infinite scroll.
  const LazyLoadingList({
    Key key,
    @required this.loadMore,
    @required this.child,
    @required this.index,
    @required this.hasMore,
    this.initialSizeOfItems = 10,
  }) : super(key: key);

  @override
  _LazyLoadingListState createState() => _LazyLoadingListState();
}

class _LazyLoadingListState extends State<LazyLoadingList>
    with MicroTaskMixin<LazyLoadingList> {
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
