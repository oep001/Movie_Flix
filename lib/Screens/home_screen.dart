import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_flix/Movies/movie_data.dart';
import 'package:movie_flix/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> popularMovies = [];
  List<Movie> nowPlayingMovies = [];
  List<Movie> comingSoonMovies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final popularResponse = await http.get(Uri.parse('https://movies-api.nomadcoders.workers.dev/popular'));
    final nowPlayingResponse = await http.get(Uri.parse('https://movies-api.nomadcoders.workers.dev/now-playing'));
    final comingSoonResponse = await http.get(Uri.parse('https://movies-api.nomadcoders.workers.dev/coming-soon'));

    if (popularResponse.statusCode == 200 && nowPlayingResponse.statusCode == 200 && comingSoonResponse.statusCode == 200) {
      setState(() {
        popularMovies = (json.decode(popularResponse.body)['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
        nowPlayingMovies = (json.decode(nowPlayingResponse.body)['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
        comingSoonMovies = (json.decode(comingSoonResponse.body)['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child:
          ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Popular Movies', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail', arguments: popularMovies[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network('https://image.tmdb.org/t/p/w500/${popularMovies[index].posterPath}')
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Now in Cinemas', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: nowPlayingMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail', arguments: nowPlayingMovies[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network('https://image.tmdb.org/t/p/w500/${nowPlayingMovies[index].posterPath}')
                        )
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Coming Soon', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: comingSoonMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail', arguments: comingSoonMovies[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network('https://image.tmdb.org/t/p/w500/${comingSoonMovies[index].posterPath}')
                          ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}
