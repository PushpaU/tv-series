import 'package:flutter/material.dart';
import 'package:tv_application/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/series.dart';
import '../api/api.dart';
import '../widgets/trending_slider.dart';
import '../widgets/series_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    late Future<List<Series>> trendingSeries;
    late Future<List<Series>> topRatedSeries;
    late Future<List<Series>> onTheAirSeries;
    @override
    void initState()
    {
        super.initState();
        trendingSeries=Api().getTrendingSeries();
        topRatedSeries=Api().getTopRatedSeries();
        onTheAirSeries=Api().getOnTheAirSeries();
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:AppBar(
            backgroundColor:Colours.scaffoldBgColor,
            elevation: 0,
            title: Text("SeriesFlex", style:GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),),
            centerTitle:true,
        ),
        body:SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children:[
                    const SizedBox(height:20),
                    Padding(
                        padding:EdgeInsets.all(8),
                        child:Text(
                            'Trending Series',
                            style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
                        ),
                            ),
                     
            const SizedBox(height:20),
            SizedBox(
                child:FutureBuilder(
                    future:trendingSeries,
                    builder:(context,snapshot){
                         //Handling Loading and error 
                        if(snapshot.hasError){
                            return Center(
                                child:Text(snapshot.error.toString()),
                            );
                        }
                        else if (snapshot.hasData){
                            
                            return  TrendingSlider(snapshot:snapshot);
                        }
                        else{
                           
                            return const Center(child:CircularProgressIndicator());
                        }

                    }
                ),
            ),

            const SizedBox(height:20),
            Padding(
                        padding:EdgeInsets.all(8),
                        child:Text(
                'Top Rated Series',
                style:GoogleFonts.aBeeZee(
                    fontSize:25,
                ),
            ),
                            ),
            
            const SizedBox(height:20),
            SizedBox(
                child:FutureBuilder(
                     //Handling Loading and error 
                    future:topRatedSeries,
                    builder:(context,snapshot){
                        if(snapshot.hasError){
                            return Center(
                                child:Text(snapshot.error.toString()),
                            );
                        }
                        else if (snapshot.hasData){
                            
                            return  SeriesSlider(snapshot:snapshot);
                        }
                        else{
                            return const Center(child:CircularProgressIndicator());
                        }

                    }
                ),
            ),
            const SizedBox(height:30),
               ]
            )
        )
    );
  }
}