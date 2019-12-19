# lazy_loading_list

Lazy loading Widget to load more by index item to incresent you list like infinite scroll.
## Getting Started

In the pubspec.yaml of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  lazy_loading_list: version
```

In your library add the following import:

```dart
import 'package:lazy_loading_list/lazy_loading_list.dart';
```

## Usage

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
```