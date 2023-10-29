import 'package:locker/data/models/locker.dart';

abstract class LockerRepository {
  Future<List<Locker>> gerLocker();
}
