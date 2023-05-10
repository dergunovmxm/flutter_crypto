import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoList());
}

class CryptoList extends StatelessWidget {
  const CryptoList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto List',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
          primarySwatch: Colors.yellow,
          dividerColor: Colors.white24,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 31, 31, 31),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20
            )
          ),
          listTileTheme: const ListTileThemeData(iconColor: Colors.white54),
          textTheme: TextTheme(
              bodyMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
              labelSmall: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  letterSpacing: .1,
                  fontWeight: FontWeight.w500))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) =>
            ListTile(
              leading: SvgPicture.asset('assets/svg/bit.svg', height: 30, width: 30,),
              title: Text("Testing", style: theme.textTheme.bodyMedium),
              subtitle: Text('2000\$', style: theme.textTheme.labelSmall),
              trailing: Icon(Icons.arrow_forward_ios),

            ),
      ),
    );
  }
}
