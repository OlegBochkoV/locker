import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:locker/data/constants/server.dart';
import 'package:locker/data/models/locker.dart';

class LockerService {
  final Dio _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  Future<List<Locker>?> getLockers() async {
    try {
      final response = await _dio.get('/ozon671game/demo/db');
      List<Locker> lockers = [];
      for (var element in response.data['lockers']) {
        lockers.add(Locker.fromJson(element));
      }
      return lockers;
    } catch (e) {
      log('LockerService getLockers\n$e');
    }
    return null;
  }
}
