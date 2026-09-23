import 'package:drift/drift.dart';

class Favorites extends Table {
  TextColumn get placeId => text()();
  DateTimeColumn get savedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {placeId};
}