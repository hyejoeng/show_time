import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:show_time/data/model/genre_model.dart';

import '../model/movie_model.dart';

class MovieRepository {
  final _client = Client();

  static const _baseUrl = 'api.themoviedb.org';
  static const _apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYTg1OTFjN2U0YzVjYWVjYjRlMDhhNzI3ODA2YWYxOSIsInN1YiI6IjY1OGQyYThmNTVjMWY0NjFkNDM5YTM3ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.t7K3U8egkt_gYmvaCGC9Hdc9OjDRzLtl0l4XA3i1_o4';
  static const _headers = {'Authorization': 'Bearer $_apiKey'};

  Future<Map<String, dynamic>?> _apiCallHandling({required Uri apiUri}) async {
    try {
      final response = await _client.get(apiUri, headers: _headers);
      if (response.statusCode != 200) {
        SystemNavigator.pop();
        return null;
      }
      return jsonDecode(response.body);
    } catch (_) {
      SystemNavigator.pop();
      return null;
    }
  }

  Future<List<T>> _getList<T>({required String path, required Function fromJson, required Map<String, dynamic> language, String resultKey = 'results'}) async {
    final List<T> itemList = [];
    final apiUri = Uri.https(_baseUrl, path, language);

    final response = await _apiCallHandling(apiUri: apiUri);
    if (response == null) return [];

    for (var json in response[resultKey]) {
      itemList.add(fromJson(json));
    }

    return itemList;
  }

  Future<List<GenreModel>> getGenre() async {
    return _getList(path: '/3/genre/movie/list', fromJson: GenreModel.fromJson, language:  {'language': 'ko', 'region': 'KR'}, resultKey: 'genres');
  }

  Future<List<MovieModel>> getTopRated() async {
    return _getList(path: '/3/movie/top_rated', fromJson: MovieModel.fromJson, language: {'language': 'ko', 'region': 'KR'});
  }

  Future<List<MovieModel>> getNowPlaying() async {
    return _getList(path: '/3/movie/now_playing', fromJson: MovieModel.fromJson, language: {'language': 'ko', 'region': 'KR', 'page': '1'});
  }

  Future<List<MovieModel>> getUpcoming() async {
    return _getList(path: '/3/movie/upcoming', fromJson: MovieModel.fromJson, language: {'language': 'ko', 'region': 'KR', 'page': '1'});
  }

// showDialog(
  // context: context,
  // builder: (BuildContext context) {
  // return AlertDialog(
  // title: Text('오류'),
  // content: Text('오류가 발생했습니다. 앱을 종료해주세요.'),
  // actions: <Widget>[
  // TextButton(
  // child: Text('닫기'),
  // onPressed: () {
  // Navigator.of(context).pop(); // 다이얼로그 닫기
  // },
  // ),
  // ],
  // );
  // },
  // );

}

