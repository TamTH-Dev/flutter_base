import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_base/models/photo.dart';
import 'package:flutter_base/services/photo.dart';

const double itemSize = 150;
const double heightFactor = 0.75;

class ShrinkTopListPage extends StatefulWidget {
  const ShrinkTopListPage({super.key});

  static Route<dynamic>? getPage(RouteSettings settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => const ShrinkTopListPage(),
      );

  @override
  State<ShrinkTopListPage> createState() => _ShrinkTopListPageState();
}

class _ShrinkTopListPageState extends State<ShrinkTopListPage> {
  final _scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    _scrollController.addListener(onListen);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(onListen);
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shrink Top List Page'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: PhotoService.fetchPhotos(params: {'_limit': 15}),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Failed to fetch data: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverToBoxAdapter(
                  child: Placeholder(
                    fallbackHeight: 100.0,
                  ),
                ),
                const SliverAppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Demo',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = items[index];
                      final itemPositionOffset =
                          index * itemSize * heightFactor;
                      final difference =
                          _scrollController.offset - itemPositionOffset;
                      final percent =
                          1 - difference / (itemSize * heightFactor);
                      final double magicValue =
                          math.max(0, math.min(1, percent));

                      return Align(
                        heightFactor: heightFactor,
                        child: Opacity(
                          opacity: magicValue,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(magicValue, 1.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    blurRadius: 20.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                margin: EdgeInsets.zero,
                                color: Colors.white,
                                child: SizedBox(
                                  height: itemSize,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text(
                                            item.title,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: items.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
