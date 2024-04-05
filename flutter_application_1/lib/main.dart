import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome To Flutter'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: items.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    child: Text('Level ${items[index]}'),
                    height: 100,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                  );
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.green,
                    child: Center(child: Text('Level ${items[index]}')),
                  );
                },
                childCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
