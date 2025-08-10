import 'package:flutter/material.dart';
import 'package:movie_flix/Movies/movie_data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://image.tmdb.org/t/p/w500/${movie.posterPath}"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withValues(alpha:0.4), BlendMode.overlay),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Text(
                            "Back to List",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.black.withValues(alpha: 0.7)
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                ]
              ),
              SizedBox(
                height: 350,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < (movie.voteAverage / 2).floor() ? Icons.star : Icons.star_border,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '2h 14min | Biography, Drama, Music',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50), // 별점과 스토리라인 간 간격

              // 스토리라인
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Storyline',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SizedBox(
                  height: 160, // Define the scrollable area height
                  child: SingleChildScrollView(
                    child: Text(
                      movie.overview,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // 스토리라인과 버튼 간 간격

              // 구매 버튼
              ElevatedButton(
                onPressed: () {
                  // 구매 로직 구현 (임시로 비워둠)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Buy ticket',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}















































/*
import 'package:flutter/material.dart';
import 'package:movie_flix/Movies/movie_data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}'), // 배경 이미지
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(const Color.fromARGB(61, 74, 104, 126).withValues(alpha: 0.6), BlendMode.overlay), // 어두운 오버레이 (선택 사항)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style:TextStyle(fontSize: 33, fontWeight: FontWeight.w900, color: Colors.white))
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 70),
                  Text('Rating: ${movie.voteAverage}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                  SizedBox(height: 5),
                  Text('Overview: ${movie.overview}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Text('Genres: ${movie.genreIds.join(', ')}', style: TextStyle(fontSize: 16)),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/