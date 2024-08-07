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
                        background:Image.network('${Constants.imagePath}${series.backDropPath}')
                    ),
                )
            ],),
        );
    }

}