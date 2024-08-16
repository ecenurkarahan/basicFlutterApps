import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pink_marble.jpg'),
          fit: BoxFit.cover
        ),
      ),
        child : Center(
        child: Column(
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
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState()=> _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //this will be updated later
  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    if(username.isEmpty|| password.isEmpty){
      Fluttertoast.showToast(msg: "Please fill empty fields!",
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 18.0,
      gravity: ToastGravity.CENTER);
    }
    else if(username=="Jhon Doe"&& password=="12345678"){
      Fluttertoast.showToast(msg: "Login Successful!",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 18.0,
          gravity: ToastGravity.CENTER);
    }
    else{
      Fluttertoast.showToast(msg: "Your credentials are wrong!",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 18.0,
          gravity: ToastGravity.CENTER);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage( 'assets/images/pink_marble.jpg'),
            fit: BoxFit.cover
            ),
      ),
        child: Center(
          child: Padding(
            padding:const EdgeInsets.all(16.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    filled:true,
                    fillColor: Colors.white70
                  ),
                  style: const TextStyle(fontFamily: 'CustomFont'),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white70
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(onPressed: _login,
                    child: const Text('Login'),
                )
              ],
            )
          )
        ),
    )
    );
  }
}
