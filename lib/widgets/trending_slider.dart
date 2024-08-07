import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tv_application/constants.dart';
import '../screens/details_screen.dart';

class TrendingSlider extends StatelessWidget {
    TrendingSlider({
        super.key,
        required this.snapshot,
    });

    final AsyncSnapshot snapshot;
 @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:double.infinity,
        child:CarouselSlider.builder(
                            itemCount:snapshot.data.length,
                            options:CarouselOptions(
                                height:300,
                                autoPlay:true,
                                viewportFraction:0.55,
                                enlargeCenterPage:true,
                                autoPlayCurve:Curves.fastOutSlowIn,
                                autoPlayAnimationDuration:const Duration(seconds:2)
                            ),
                            itemBuilder:(context,itemIndex,pagevieIndex){
                                return GestureDetector(
                                    onTap:()
                                    {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:(context)=>DetailsScreen(
                                                    series:snapshot.data[itemIndex],
                                                ),
                                            ),
                                        );
                                    },
                                 child:ClipRRect(
                                    borderRadius:BorderRadius.circular(12),
                                    child:SizedBox(
                                    height:300,
                                    width:200,
                                    child:Image.network(
                                        filterQuality:FilterQuality.high,
                                        fit:BoxFit.cover,
                                        '${Constants.imagePath}${snapshot.data[itemIndex].posterpath}'
                                    )
                                )
                                ),);
                            }
                        )
                    

    );
  }

}