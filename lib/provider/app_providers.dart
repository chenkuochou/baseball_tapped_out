import 'package:baseball_tapped_out/model/enum/app_lifecycle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLifecycleProvider = StateProvider((_) => MyAppLifecycle.unregistered);
