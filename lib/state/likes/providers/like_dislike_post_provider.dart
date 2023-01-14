import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/firebase_collection_name.dart';
import '../../constants/firebase_field_name.dart';
import '../models/like.dart';
import '../models/like_dislike_request.dart';

final likeDislikePostProvider =
    FutureProvider.family.autoDispose<bool, LikeDislikeRequest>(
  (
    ref,
    LikeDislikeRequest request,
  ) async {
    final query = FirebaseFirestore.instance
        .collection(
          FirebaseCollectionName.likes,
        )
        .where(
          FirebaseFieldName.postId,
          isEqualTo: request.postId,
        )
        .where(
          FirebaseFieldName.userId,
          isEqualTo: request.likedBy,
        )
        .get();

    final hasLiked = await query.then(
      (value) => value.docs.isNotEmpty,
    );
    if (hasLiked) {
      try {
        await query.then((value) async {
          for (final doc in value.docs) {
            await doc.reference.delete();
          }
        });
        return true;
      } catch (_) {
        return false;
      }
    } else {
      final like = Like(
        postId: request.postId,
        likedBy: request.likedBy,
        date: DateTime.now(),
      );

      try {
        await FirebaseFirestore.instance
            .collection(FirebaseCollectionName.likes)
            .add(like);
        return true;
      } catch (_) {
        return false;
      }
    }
  },
);
