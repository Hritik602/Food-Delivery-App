

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/Colors/appColors.dart';

class AdPic extends StatelessWidget {
  const AdPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          enableInfiniteScroll: true,
          viewportFraction: 1,
          //autoPlayAnimationDuration: const Duration(milliseconds: 100),
          autoPlay: false,
          autoPlayInterval: Duration(milliseconds: 1000),
        ),
        // ignore: non_constant_identifier_names
        itemBuilder: (BuildContext, int index, int) {
          return Container(
            width: 359,

            //  child: Center(child: Text(index.toString(),
            //style: TextStyle(
            //fontWeight: FontWeight.bold,
            //fontSize: 25
            decoration: BoxDecoration(
              // color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(images[index].imagesPath!))),
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                   Colors.red.withOpacity(0.1),
                    Colors.yellow.withOpacity(0.1),
                  ]
                )
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\t Get 30%*\n",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 29,
                            color: Colors.white,
                          )
                        )
                      ),
                      TextSpan(
                          text: "Discount",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 29,
                                color: Colors.amber,
                              )
                          )
                      ),

                    ]
                  ),
                )
              ),
            ),
          );
        });
  }
}

class AdPicture {
  String ? imagesPath;

  AdPicture({required this.imagesPath});
}

  List<AdPicture> images=[
    AdPicture(imagesPath:"asset/images/best-delicious-food.jpg"),
    AdPicture(imagesPath: "asset/images/Pizza.jpg"),
    AdPicture(imagesPath: "asset/images/coffee.jpg"),
  ];