import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../image_upload/typedefs/is_loading.dart';
import '../notifiers/delete_comment_notifier.dart';

final deleteCommentProvider =
    StateNotifierProvider<DeleteCommentStateNotifier, IsLoading>(
  (_) => DeleteCommentStateNotifier(),
);
