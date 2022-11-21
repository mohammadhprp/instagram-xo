import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/image_upload/models/thumbnail_request.dart';
import '../../state/image_upload/providers/thumbnail_provider.dart';
import 'animations/loading_animation_view.dart';
import 'animations/models/small_error_animation_view.dart';

class ThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;
  const ThumbnailView({
    super.key,
    required this.thumbnailRequest,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(thumbnailProvider(thumbnailRequest));

    return thumbnail.when(
      data: (imageAspectRatio) {
        return AspectRatio(
          aspectRatio: imageAspectRatio.aspectRatio,
          child: imageAspectRatio.image,
        );
      },
      loading: () => const LoadingAnimationView(),
      error: (error, stackTrace) => const SmallErrorAnimationView(),
    );
  }
}
