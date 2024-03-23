import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../config/responsive.dart';

class DeepLinks extends StatelessWidget {
  const DeepLinks({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        SizedBox(
          width: 70,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              useOldImageOnUrlChange: true,


              placeholder: (context, string){

                return Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey,
                  child: const SizedBox(height: 50, width: 50),
                );

              },

            ),

          ),

        ),

        const SizedBox(height: 5),

        Text(
          title,

          style: TextStyle(fontFamily: 'Vazir', fontSize: Responsive.isMobile(context) ? 11 : 18),
        )

      ],
    );

  }

}
