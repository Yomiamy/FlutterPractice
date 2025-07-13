import 'package:flutter/material.dart';
import 'package:flutter_practice/homework/github_client/widgets/github_client_app.dart';
import 'package:flutter_practice/tab/favors_page.dart';

import 'homework/github_client/common/Global.dart';

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalStorageTodosApi(
  //     plugin: await SharedPreferences.getInstance(),
  // );
  //
  // bootstrap(todosApi: todosApi);
  // runApp(const MyApp());

  Global.instance.init().then((_) => runApp(const GithubClientApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(
        //     textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        //     useMaterial3: true),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // theme: ThemeData(
        //     colorScheme: const ColorScheme.light(
        //         primary: Color.fromRGBO(72, 74, 126, 1)
        //     )
        // ),
        home: FavorsPage());
  }
}
