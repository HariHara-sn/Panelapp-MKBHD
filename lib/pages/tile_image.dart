import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final double extent;
  final String imgsource;

  const Tile({
    required this.index,
    required this.extent,
    super.key,
    required this.imgsource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: extent,
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length],
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.network(
            height: extent,
            width: double.infinity,
            imgsource,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Art $index',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
