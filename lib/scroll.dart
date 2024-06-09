import 'dart:async';
import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;

  final Duration _debouceDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // Cancel the previous debounced call
      if (_debounce?.isActive ?? false) _debounce?.cancel();

      // Schedule a new debounced call
      _debounce = Timer(_debouceDuration, () {
        loadMoreItems();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void loadMoreItems() {
    print('Loading more items...');
    // Implement your logic to load more items here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrolling Debouncing in Flutter'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item $index'));
          },
        ),
      ),
    );
  }
}
