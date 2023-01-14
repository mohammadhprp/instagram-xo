import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/providers/user_id_provider.dart';
import '../models/post.dart';

final canCurrentUserDeletePostProvider =
    StreamProvider.autoDispose.family<bool, Post>((ref, Post post) async* {
  final userId = ref.watch(userIdProvider);
  yield userId == post.userId;
});
