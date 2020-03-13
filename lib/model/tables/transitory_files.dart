import 'package:moor_flutter/moor_flutter.dart';

/// A type of File that will shortly be deleted, as soon as the synchronization
/// occurs. Used only inside the TopScreen as long as the synchronization with
/// the cloud has not been completed.
class TransitoryFiles extends Table {
  TextColumn get id => text()();

  TextColumn get path => text()();

  TextColumn get name => text()();

  DateTimeColumn get date => dateTime()();

  TextColumn get description => text()();

  TextColumn get directory => text()();

  @override
  Set<Column> get primaryKey => {id};
}
