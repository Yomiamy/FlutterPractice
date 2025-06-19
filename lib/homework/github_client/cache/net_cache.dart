import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_practice/homework/github_client/common/Global.dart';

import 'cache_object.dart';

class NetCache extends Interceptor {

  LinkedHashMap<String, CacheObject> cache = LinkedHashMap<String, CacheObject>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    bool isCacheEnabled = Global.instance.user?.cacheConfig?.enabled ?? false;
    bool refreshCache = options.extra['refresh'] ?? false;

    if(refreshCache) {
      bool isList = options.extra['list'];
      if(isList) {
        // 如果是列表請求，則清除以options.path開頭的所有緩存
        cache.removeWhere((key, value) => key.startsWith(options.path));
      } else {
        // 如果是單個請求，則清除該請求的緩存
        cache.remove(options.uri.toString());
      }
    }

    bool isNoCache = options.extra['noCache'] ?? true;
    bool isGetMethod = options.method.toUpperCase() == 'GET';
    // 如果緩存啟用 且 請求為GET方法 且 請求標記為使用緩存, 則進緩存處理
    if(isCacheEnabled && !isNoCache && isGetMethod) {
      // 檢查緩存中是否存在該請求的Response; 有指定cacheKey則使用該key，否則使用api url作為key
      String key = options.extra['cacheKey'] ?? options.uri.toString();
      CacheObject? cacheObject = cache[key];

      if(cacheObject != null) {
        int maxAge = Global.instance.user?.cacheConfig?.maxAge ?? 0;

        if((DateTime.now().millisecondsSinceEpoch - cacheObject.timeStamp / 1000) <  maxAge) {
          // 緩存的Response未過期
          Response response = cacheObject.response;
          // 直接返回現存的response
          handler.resolve(response);
          return;
        } else {
          // 緩存的Response已過期，從緩存中移除
          cache.remove(key);
        }
      }
    }

    // 繼續後續的API請求
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    bool isCacheEnabled = Global.instance.user?.cacheConfig?.enabled ?? false;
    RequestOptions options = response.requestOptions;
    bool isNoCache = options.extra['noCache'] ?? true;
    bool isGetMethod = options.method.toUpperCase() == 'GET';

    // 如果緩存啟用 且 請求為GET方法 且 請求標記為使用緩存, 則進緩存處理
    if(isCacheEnabled && isGetMethod && !isNoCache) {
      _saveCache(response);
    }
  }

  void _saveCache(Response response) {
    String key = response.requestOptions.extra['cacheKey'] ?? response.requestOptions.uri.toString();
    CacheObject cacheObject = CacheObject(response: response);

    if(!cache.containsKey(key)) {
      // 如果緩存中不存在該key，則添加到緩存中
      int maxCount = Global.instance.user?.cacheConfig?.maxCount ?? 100;

      if(cache.length >= maxCount) {
        // 如果緩存已滿，則移除最舊的緩存
        cache.remove(cache.keys.first);
      }
    }
    cache[key] = cacheObject;
  }
}