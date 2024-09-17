import 'package:isar/isar.dart';

part 'habit.g.dart';

@Collection()
class Habit {

  //habbit id
  Id id = Isar.autoIncrement;

  //habbit name
  late String name;

  //completed dats
  List<DateTime> completedDays = [
    //DateTime(year, month, day),
    //DateTime(2024, 1, 1)
  ];
}
