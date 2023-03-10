import 'package:anther/cubit/layout_cubit.dart';
import 'package:anther/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/post_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>AuthCubit())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: const HomeScreen(),
          routes: {
            'postScreen': (context) => PostScreen(),
          },
        )
    );
  }
}
