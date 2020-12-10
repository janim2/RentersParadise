part of 'walkthrough_cubit.dart';

@immutable
abstract class WalkthroughState {
  const WalkthroughState();
}

class WalkthroughInitial extends WalkthroughState {
  const WalkthroughInitial();
}

class WalkthroughFinished extends WalkthroughState {
  const WalkthroughFinished();
}
