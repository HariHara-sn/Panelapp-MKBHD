import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:panelapp/pages/tile_image.dart';

class HomePage extends StatelessWidget {
  final ScrollController scrollController; //!!
  const HomePage({super.key, required this.scrollController}); //!!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: NestedScrollView(
          controller: scrollController, // Use the passed scrollController !!
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                surfaceTintColor: Colors.white,
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                centerTitle: true,
                title: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                bottom: const TabBar(
                  tabs: [
                    Text('Suggest'),
                    Text('Liked'),
                    Text('Library'),
                  ],
                  indicatorColor: Colors.red,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              //Tab-1
              MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  return Tile(
                    index: index,
                    imgsource: 'https://picsum.photos/500/800?random=$index',
                    extent: (index % 2 == 0 ? 300 : 150),
                  );
                },
              ),

              //Tab-2
              const Text('Liked'),

              //Tab-3
              const Text('Library')
            ],
          ),
        ),
      ),
    );
  }
}
