import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/widgets/stars.dart';
import '../../../models/product.dart';

class RecommendationBox  extends StatelessWidget {
  final Product recommendation ;
  const RecommendationBox ({
    super.key,
    required this.recommendation ,
  });

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < recommendation .rating!.length; i++) {
      totalRating += recommendation .rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / recommendation .rating!.length;
    }
    return Container(
      // height: 200,
      padding: const EdgeInsets.all(8.0),
      width: 150,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border:  Border.all(color: Colors.grey[300]!)
            ),
            child: Image.network(
              recommendation.images[0],
              fit: BoxFit.contain,

              errorBuilder: (context, error, stackTrace) {
                return Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey[300]!,
                  child: Container(
                    height: 135,
                    width: 135,
                    color: Colors.grey[300],
                  ),
                );
              },
            ),
          ), //image
          Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    recommendation.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  padding:
                  const EdgeInsets.only(left: 10, top: 5),
                  child: Stars(
                    rating: avgRating,
                  ),
                ),
                Container(
                  width: 150,
                  padding:
                  const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    '\$${recommendation.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('Eligible for FREE Shipping'),
                ),
                Container(
                  width: 150,
                  padding:
                  const EdgeInsets.only(left: 10, top: 5),
                  child: const Text(
                    'In Stock',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}