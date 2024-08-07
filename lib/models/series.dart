class Series{
    String title;
    String backDropPath;
    String originalTitle;
    String overview;
    String posterpath;
    String firstAirDate;
    double voteAverage;

    Series({
        required this.title,
        required this.backDropPath,
        required this.originalTitle,
        required this.overview,
        required this.posterpath,
        required this.firstAirDate,
        required this.voteAverage,
    });

    factory Series.fromJson(Map<String,dynamic>json){
        return Series(
            title: json["name"] ?? "No Title",
            backDropPath: json["backdrop_path"] ?? "",
            originalTitle: json["original_name"] ?? "No Original Title",
            overview: json["overview"] ?? "No Overview",
            posterpath: json["poster_path"] ?? "",
            firstAirDate: json["first_air_date"] ?? "No Air Date",
            voteAverage: json["vote_average"] != null
                ? json["vote_average"] is int
                    ? (json["vote_average"] as int).toDouble()
                    : json["vote_average"].toDouble()
                : 0.0,
    );
    }
}