import 'package:baseball_tapped_out/model/enum/app_lifecycle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final appLifecycleProvider = StateProvider((_) => MyAppLifecycle.unregistered);
