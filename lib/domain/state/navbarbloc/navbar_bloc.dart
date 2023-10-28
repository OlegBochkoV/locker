import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker/domain/state/navbarbloc/navbar_event.dart';
import 'package:locker/domain/state/navbarbloc/navbar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(InitState()) {
    on<ChangePageEvent>(_changePage);
  }

  void _changePage(ChangePageEvent event, Emitter<NavBarState> emit) async {
    emit(ChangePageState(page: event.page));
  }
}
