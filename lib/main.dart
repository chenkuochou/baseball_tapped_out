// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:baseball_tapped_out/bag/bag.dart';
import 'package:baseball_tapped_out/layout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'firebase_options.dart';
final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   if (kDebugMode) {
//     try {
//       FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
//       await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

  // generatePitchers().forEach((e) {
  //   print('$e\n===\n');
  // });

  // runApp(const LoadingScreen());
  // ImageUtils.svgPrecacheImage();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.clear();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: MaterialApp(
        title: 'Baseball Tapped Out',
        theme: ThemeData(
          brightness: Brightness.dark,

          // textTheme: GoogleFonts.pressStart2pTextTheme(),
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.pressStart2p(
              fontSize: 9,
            ),
          ),
          // fontFamily: 'PressStart2P',
          // textTheme: const TextTheme(
          //   bodyMedium: TextStyle(fontSize: 11.0),
          // )
        ),
        debugShowCheckedModeBanner: false,
        home: const LayoutPage(),
      ),
    ),
  );
}
