import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_architecture_flutter_firebase/src/features/entries/domain/entry.dart';
import 'package:starter_architecture_flutter_firebase/src/features/jobs/domain/job.dart';

part 'entry_job.freezed.dart';

@freezed
class EntryJob with _$EntryJob {
  const factory EntryJob(Entry entry, Job job) = _EntryJob;
}