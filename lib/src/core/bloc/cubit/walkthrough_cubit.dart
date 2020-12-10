import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'walkthrough_state.dart';

class WalkthroughCubit extends Cubit<WalkthroughState> {
  WalkthroughCubit() : super(WalkthroughInitial());

  void changeWalkThrough() {
    emit(WalkthroughFinished());
  }
}
