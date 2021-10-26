import 'package:flutter/material.dart';

class ListMovie {
  List<MovieInfomation> listMovie = [];
  ListMovie() {
    listMovie.add(MovieInfomation(
        AssetImage('assets/images/PosterGambitHau.jpeg'),
        "Gambit Hậu là một bộ phim truyền hình ngắn tập chiếu mạng thể loại chính kịch thời kì dựa trên tiểu thuyết cùng tên năm 1983 của Walter Tevis. Tiêu đề của bộ phim cũng là tên một nước đi khai cuộc cờ vua. Tác phẩm do Scott Frank cùng Allan Scott đồng sáng lập và được Frank chắp bút kiêm đạo diễn. Câu chuyện xoay quanh nữ kỳ thủ cờ vua thiên tài mồ côi cha mẹ Beth Harmon (Anya Taylor-Joy) trên hành trình trở thành kỳ thủ vĩ đại nhất thế giới trong khi vật lộn với chứng nghiện rượu và thuốc an thần, cũng như các vấn đề về tâm lý.",
        8.6,
        79,
        80,
        'https://www.youtube.com/watch?v=kwrQzTz16w4',
        'https://www.youtube.com/watch?v=kwrQzTz16w4',
        'GAMBIT HẬU'));
  }
}

class MovieInfomation {
  final AssetImage assetImage;
  final String name;
  final String filmDescription;
  final double imdbScore;
  final double tomatoesScore;
  final int mScore;
  final String previewLink;
  final String movieLink;
  MovieInfomation(
      this.assetImage,
      this.filmDescription,
      this.imdbScore,
      this.tomatoesScore,
      this.mScore,
      this.previewLink,
      this.movieLink,
      this.name);
}
