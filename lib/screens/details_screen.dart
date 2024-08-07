import 'package:flutter/material.dart';
import '../models/series.dart';
import 'package:tv_application/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_application/constants.dart';

class DetailsScreen extends StatelessWidget{
    const DetailsScreen({
        super.key,
        required this.series,
    });

    final Series series;
    @override
    Widget build(BuildContext context){
        return  Scaffold(
        
            body:CustomScrollView(
                slivers:[
                SliverAppBar.large(
                    leading:Container(
                        height:70,
                        width:70,
                        margin:const EdgeInsets.only(top:8,left:8),
                    decoration:  BoxDecoration(
                        color:Colours.scaffoldBgColor,
                        borderRadius:BorderRadius.circular(8),
                    ),
                    child:IconButton(
                        onPressed:(){
                            Navigator.pop(context);
                        },
                        icon:const Icon(
                            Icons.arrow_back_rounded,
                        ),
                    ),),
                    backgroundColor:Colours.scaffoldBgColor,
                    expandedHeight:500,
                    pinned:true,
                    floating:true,
                    flexibleSpace:FlexibleSpaceBar(
                        title:Text(
                            series.title,
                            style:GoogleFonts.belleza(
                                fontSize:17,
                                fontWeight:FontWeight.w600,),),
                        background:ClipRRect(
                            borderRadius:const BorderRadius.only(
                                bottomLeft:Radius.circular(24),
                                bottomRight:Radius.circular(24),

                            ),
                            child:Image.network(
                            '${Constants.imagePath}${series.backDropPath}',
                        filterQuality:FilterQuality.high,
                        fit:BoxFit.fill,
                        )
                        )
                    ),
                ),
                SliverToBoxAdapter(
                    child:Padding(
                        padding:const EdgeInsets.all(12),
                        child:Column(
                            children:[
                                Text(
                                    'Overview',
                                    style:GoogleFonts.openSans(
                                        fontSize:30,
                                        fontWeight:FontWeight.w800,),

                                ),
                                const SizedBox(height:16),
                                Text(
                                    series.overview,
                                    style:GoogleFonts.roboto(
                                        fontSize:20,
                                        fontWeight:FontWeight.w400,),
                                        textAlign:TextAlign.justify,

                                ),
                                const SizedBox(height:16),
                                SizedBox(
                                    child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children:[
                                            Container(
                                                padding:const EdgeInsets.all(8),
                                                decoration:BoxDecoration(
                                                    border:Border.all(color:Colors.grey),
                                                    borderRadius:BorderRadius.circular(10),

                                                ),
                                                child:Row(children:[
                                                    Text(
                                                        'Air date:',
                                                        style:GoogleFonts.roboto(
                                                            fontSize:17,
                                                            fontWeight:FontWeight.bold,),
                                                    ),
                                                    Text(
                                                        series.firstAirDate,
                                                        style:GoogleFonts.roboto(
                                                            fontSize:17,
                                                            fontWeight:FontWeight.bold,),
                                                    )
                                                ],
                                                ),

                                            ),
                                            Container(
                                                padding:const EdgeInsets.all(8),
                                                decoration:BoxDecoration(
                                                    border:Border.all(color:Colors.grey),
                                                    borderRadius:BorderRadius.circular(10),

                                                ),
                                                child:Row(
                                                    children:[
                                                       Text(
                                                        'Rating:',
                                                        style:GoogleFonts.roboto(
                                                            fontSize:17,
                                                            fontWeight:FontWeight.bold,),
                                                    ), 
                                                    const Icon(
                                                        Icons.star,
                                                        color:Colors.amber,
                                                    ),
                                                    Text(
                                                        '${series.voteAverage.toStringAsFixed(1)}/10',
                                                        style:GoogleFonts.roboto(
                                                            fontSize:17,
                                                            fontWeight:FontWeight.bold,),
                                                    )
                                                    ]
                                                )
                                            )
                                        ]
                                    )
                                ),
                            ]
                        )
                    )
                )
            ],),
        );
    }

}