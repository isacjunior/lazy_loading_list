# lazy_loading_list

Lazy loading Widget to load more by index item to incresent you list like infinite scroll.
## Getting Started

In the pubspec.yaml of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  scroll_to_index: ^0.0.1
```

In your library add the following import:

```dart
import 'package:lazy_loading_list/lazy_loading_list.dart';
```

## Usage

```dart
ListView.separated(
    controller: controller,
    itemCount: list.length,
    itemBuilder: (context, index) {
        return LazyLoadingList(
            index: index,
            child: buildItem(),
            loadMore: loadMoreItems,
            hasMore: hasMoreToLoad,
        );
    },
),
```