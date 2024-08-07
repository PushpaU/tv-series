import 'package:tv_application/constants.dart';
import 'package:tv_application/models/series.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api{
    static const _trendingUrl='https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';
    static const _topratedUrl='https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';
    static const _onTheAirUrl='https://api.themoviedb.org/3/tv/on_the_air??api_key=${Constants.apiKey}';
    

    Future<List<Series>> getTrendingSeries() async{
        final response=await http.get(Uri.parse(_trendingUrl));
        if(response.statusCode==200)
        {
            final decodedData=json.decode(response.body)['results'] as List;
            return decodedData.map((series)=>Series.fromJson(series)).toList();
            
        }
        else
        {
            throw Exception('Something Happend');
        }
    }

    Future<List<Series>> getTopRatedSeries() async{
        final response=await http.get(Uri.parse(_topratedUrl));
        if(response.statusCode==200)
        {
            final decodedData=json.decode(response.body)['results'] as List;
            return decodedData.map((series)=>Series.fromJson(series)).toList();
            
        }
        else
        {
            throw Exception('Something Happend');
        }
    }

    Future<List<Series>> getOnTheAirSeries() async{
        final response=await http.get(Uri.parse(_onTheAirUrl));
        if(response.statusCode==200)
        {
            final decodedData=json.decode(response.body)['results'] as List;
            return decodedData.map((series)=>Series.fromJson(series)).toList();
            
        }
        else
        {
            throw Exception('Something Happend');
        }
    }
}