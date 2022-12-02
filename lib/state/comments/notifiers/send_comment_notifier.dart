import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/firebase_collection_name.dart';
import '../../image_upload/typedefs/is_loading.dart';
import '../../posts/typedefs/post_id.dart';
import '../../posts/typedefs/user_id.dart';
import '../models/comment_payload.dart';

class SendCommentNotifier extends StateNotifier<IsLoading> {
  SendCommentNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> sendComment({
    required UserId fromUserId,
    required PostId onPostId,
    required String comment,
  }) async {
    isLoading = true;
    final payload = CommentPayload(
      fromUserId: fromUserId,
      onPostId: onPostId,
      comment: comment,
    );
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.comments)
          .add(payload);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
