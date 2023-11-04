import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_architecture_flutter_firebase/src/features/jobs/domain/job.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

typedef EntryID = String;

@freezed
class Entry with _$Entry {

  const Entry._();

  const factory Entry({
    required EntryID id,
    required JobID jobId,
    required DateTime start,
    required DateTime end,
    required String comment,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  factory Entry.fromMap(Map<dynamic, dynamic> value, EntryID id) {
    final startMilliseconds = value['start'] as int;
    final endMilliseconds = value['end'] as int;
    return Entry(
      id: id,
      jobId: value['jobId'] as String,
      start: DateTime.fromMillisecondsSinceEpoch(startMilliseconds),
      end: DateTime.fromMillisecondsSinceEpoch(endMilliseconds),
      comment: value['comment'] as String? ?? '',
    );
  }
}

extension EntryMixin on Entry {
  double get durationInHours =>
      end.difference(start).inSeconds.toDouble() / 3600.0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobId': jobId,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'comment': comment,
    };
  }
}