import 'package:hive/hive.dart';

part 'model_note.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  // att. :=
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color = 0xff00a98f;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
