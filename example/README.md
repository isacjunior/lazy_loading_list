Example in: `example/lib/main.dart`

```dart
ListView.builder(
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index) {
        return LazyLoadingList(
            initialSizeOfItems: 10,
            index: index,
            child: buildItem(),
            loadMore: loadMoreItems,
            hasMore: hasMoreToLoad,
        );
    },
),
