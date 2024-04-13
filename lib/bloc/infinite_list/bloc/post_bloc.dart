import 'dart:convert';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/post.dart';
import 'post_event.dart';
import 'post_state.dart';

class InfiniteListBloc extends Bloc<PostFetched, PostState> {
  InfiniteListBloc() : super(const PostState(status: PostStatus.initial)) {
    on<PostFetched>(_eventHandler);
  }

  void _eventHandler(PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        List<Post> posts = List.empty(growable: true);
        int i = 5;

        do {
          List<Post> subPosts = await _fetchPosts();
          posts.addAll(subPosts);
        } while(--i >= 0);

        emit(state.copyWith(
            status: PostStatus.success, posts: posts, hasReachedMax: false));
      } else {
        final posts = await _fetchPosts();
        emit(posts.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: PostStatus.success,
                posts: state.posts..addAll(posts),
                hasReachedMax: false));
      }
    } on Exception catch (e, s) {
      debugPrint('Exception details:\n $e');
      debugPrint('Stack trace:\n $s');
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    final response = await Dio().get(
        "https://my-json-server.typicode.com/Yomiamy/FakeJsonServer/posts",
        queryParameters: {'_start': '$startIndex', '_limit': '20'});

    if (response.statusCode == 200) {
      final body = response.data;
      List<Post> list = body.map<Post>((dataMap) => Post(
                id: dataMap['id'] as int?,
                title: dataMap['title'] as String?,
                body: dataMap['body'] as String?,
              ))
          .toList();
      return list;
    }
    throw Exception('error fetching posts');
  }

  @override
  void onChange(Change<PostState> change) {
    super.onChange(change);

    debugPrint("onChange: $change");
  }
}
