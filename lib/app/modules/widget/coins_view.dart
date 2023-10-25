import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class CoinsView extends StatelessWidget {
  final String starImage;
  final String imgurls;
  final String rank;
  final String name;
  final String symbol;
  final String discriptions;
  const CoinsView({
    super.key,
    required this.starImage,
    required this.rank,
    required this.imgurls,
    required this.name,
    required this.symbol,
    required this.discriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              starImage,
              width: 22,
              height: 22,
              color: Colors.yellow,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              rank,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: CachedNetworkImage(
                  imageUrl: imgurls,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const Center(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  symbol,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding:
              const EdgeInsets.only(left: 48.0, right: 8, bottom: 8, top: 8),
          child: ExpandableText(
            animation: true,
            discriptions,
            expandText: 'more',
            collapseText: 'See less',
            maxLines: 2,
            linkColor: Colors.blue,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            animationCurve: Curves.easeOut,
            animationDuration: const Duration(milliseconds: 250),
          ),
        )
      ],
    );
  }
}
