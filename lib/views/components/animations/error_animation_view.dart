import 'lottie_animation_view.dart';
import 'models/lottie_animations.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
          reverse: true,
        );
}
