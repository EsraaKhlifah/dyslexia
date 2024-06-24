import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/cache/cache_helper.dart';
import '../../service/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState>{
  GlobalCubit() : super(GlobalInitial());


}