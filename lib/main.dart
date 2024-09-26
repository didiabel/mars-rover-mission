import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_mission/firebase_options.dart';
import 'package:mars_rover_mission/screens/bloc/bloc_screen.dart';
import 'package:mars_rover_mission/screens/provider/provider_screen.dart';
import 'package:mars_rover_mission/screens/set_state_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mars rover mission'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(), // este Row solo es para que la columna ocupe toda el width
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetStateScreen(),
                    ),
                  );
                },
                child: const Text('Case study solved with setState'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProviderScreen(),
                    ),
                  );
                },
                child: const Text('Case study solved with Provider'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BlocScreen(),
                    ),
                  );
                },
                child: const Text('Case study solved with BLoC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
