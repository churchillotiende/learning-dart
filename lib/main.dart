import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

void test() {
  // final name = 'foo';

  // if (name == 'foo') {
  //   print('yes this is foo');
  // }
  // final age = 20;
  // final halfAge = age / 2;
  // print('half age is: $halfAge');

  // final name = "Test name";

  // if (name == "Test name") {
  //   print("it is test name");
  // }

  // final names = ["foo", "bar", "baz"];
  // print(names[0]);

  // Making any type nullable
  String? name = null;
  name = "foo";
  print(name);
  name = null;
  print(name);

  // Optional list of optional strings
  List<String?>? names = ["foo", "bar", "booz", null];
  print(names);
}

void nonNullAwareAssignmentOperator() {
  String? firstName = null;
  String? middlename = null;
  String? lastName = "First non null value";

  final firstNonNullValue = firstName ?? middlename ?? lastName;

  print(firstNonNullValue);
}

void nullAwareAssignmentOperator() {
  String? firstName = null;
  String? middlename = null;
  String? lastName = "Picking the non null value";

  String? name = firstName;
  name ??= middlename;
  name ??= lastName;
  print(name);
}

void conditionalInvocation() {
  List<String?>? names = ['Baz', 'foo'];
  final length = names?.length ?? 0;
  print(length);
}

// Extensions
class Cat {
  final String? name;
  Cat(this.name);
}

extension Run on Cat {
  String? run() {
    print('the cat $name is running');
  }
}

enum PersonalProperties { firstName, lastName, age }

enum AnimalType { cat, dog, bunny }

void Animals(AnimalType animalType) {
  switch (animalType) {
    case AnimalType.bunny:
      print("Bunny");
      return;
    case AnimalType.cat:
      print("Cat");
      return;
    case AnimalType.dog:
      print("Dog");
      return;
  }
}

class Person extends LivingThing {}

/**An abstract class is a class that cannot be instantiated */
abstract class LivingThing {
  void run() {
    print("Running");
  }

  void breath() {
    print("Breathing");
  }

  void sleep() {
    print("Sleeping");
  }
}

class PersonConstructor {
  final String? name;

  PersonConstructor(this.name);
}

// Future.Delayed
Future<int> heavyFutureThatMultipliesByTwo(int a) {
  return Future.delayed(Duration(seconds: 3), () {
    return a * 2;
  });
}

// Stream
Stream<String> getName() {
  return Stream.value('Stream value');
}

void awaitStreamValue() async {
  await for (final value in getName()) {
    print(value);
  }
  print("Stream finished updating");
}

void asyncAwaitFuture() async {
  final result = await heavyFutureThatMultipliesByTwo(20);
  print(result);
}

// Iterable
Iterable<int> getOneTwoThree() sync* {
  yield 1;
  yield 2;
  yield 3;
}

void IterateThroughValues() {
  for (final value in getOneTwoThree()) {
    print(value);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Animals(AnimalType.bunny);
    print(PersonalProperties.firstName.name);
    conditionalInvocation();
    nullAwareAssignmentOperator();
    nonNullAwareAssignmentOperator();
    test();
    final meow = Cat("Fluffers");
    print(meow.name);
    print(meow.run());
    // person object
    final person = new Person();
    person.breath();
    asyncAwaitFuture();
    awaitStreamValue();
    IterateThroughValues();

    final nameForConstructor = PersonConstructor("Name for the constructor");
    print(nameForConstructor.name);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.1
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
