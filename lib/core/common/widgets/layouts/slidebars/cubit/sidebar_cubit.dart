import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(SidebarState());
}
