import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker/data/models/locker.dart';
import 'package:locker/data/repository/locker_service.dart';
import 'package:locker/domain/repository/locker_repository.dart';
import 'package:locker/domain/state/mainbloc/main_event.dart';
import 'package:locker/domain/state/mainbloc/main_state.dart';

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(InitState()) {
    on<GetLockersEvent>(_getLocker);
  }

  LockerRepository lockerService = LockerService();
  List<Locker> lockers = [];
  bool isLoading = true;

  void _getLocker(GetLockersEvent event, Emitter<MainBlocState> emit) async {
    isLoading = true;
    emit(LoadingLockersState());
    lockers = await lockerService.gerLocker();
    isLoading = false;
    emit(LoadLockerState(locker: lockers));
  }
}
