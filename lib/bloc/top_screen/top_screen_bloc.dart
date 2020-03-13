import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sigamed_tele_medicina/model/repository/app_repository.dart';

import '../bloc.dart';

class TopScreenBloc extends Bloc<TopScreenEvent, TopScreenState> {
  @override
  TopScreenState get initialState => TopScreenEmpty();

  @override
  Stream<TopScreenState> mapEventToState(
    TopScreenEvent event,
  ) async* {
    if (event is InsertTransitoryFile) {
      yield TopScreenInserting();
      try {
        //copysync the file to our directory
        await AppRepository().insertTransitoryFile(event.transitoryFile);
        yield TopScreenInserted();
      } catch (e) {
        print(e.toString());
        yield TopScreenNotInserted();
      }
    }
  }
}
