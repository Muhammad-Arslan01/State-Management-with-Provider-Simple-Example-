import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'counter.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => Counter()),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        title: 'Flutter Demo',
        theme: ThemeData(
     
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
          
          
      );
    
  }
}

 

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  void _incrementCounter() {
          var counter = context.read<Counter>();
          counter.increment();
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar( 
        title: Text(widget.title),
      ),
      body: Center( 
        child: Column(
 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            Consumer<Counter>(
           builder: (context,counter,child) =>Text(
              '${counter.value}',
              //style: Theme.of(context).textTheme.headline4,
            ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add_box),
      ),  
    );
  }
}
