import 'package:equatable/equatable.dart';
import 'package:sigamed_tele_medicina/model/database/app_database.dart';

abstract class TopScreenEvent extends Equatable {
  const TopScreenEvent();
}

class InsertTransitoryFile extends TopScreenEvent {
  InsertTransitoryFile(this.transitoryFile);

  final TransitoryFile transitoryFile;
  //the whole file
  //new path
  //name
  //description
  //date

  @override
  List<Object> get props => [];
}
