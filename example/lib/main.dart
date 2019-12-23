// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';

void main() {
  runApp(MyApp(
    items: List<String>.generate(50, (i) => 'Item $i'),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return LazyLoadingList(
              initialSizeOfItems: 10,
              index: index,
              hasMore: true,
              loadMore: () => print('Loading More'),
              child: ListTile(
                title: Text('${items[index]}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
