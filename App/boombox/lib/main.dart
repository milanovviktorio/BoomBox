import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

int _currentIndex = 0;

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color(0xffe0fbfc),
      appBar: AppBar(
        title: const Text('BoomBox'),
        backgroundColor: const Color(0xff9db4c0),
        titleTextStyle: const TextStyle(
          color: Color(0xffe0fbfc),
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to BoomBox!',
              style: TextStyle(fontSize: 24),
            ),
            Image.asset('assets/trust.png'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: const Color(0xff9db4c0),
      selectedItemColor: const Color(0xff253237),  
      unselectedItemColor: const Color(0xffe0fbfc),
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color:Color(0xff253237)),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined, color: Color(0xffe0fbfc)),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color:Color(0xffe0fbfc)),
      label: 'Profile',
    ),
  ],
  onTap: (int index) {
    switch (index) {
      case 0:
        _currentIndex = 1;
        Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
        break;
      case 1:
        _currentIndex = 2;
        Navigator.push(context, MaterialPageRoute(builder: (_) => Messages()));
        break;
      case 2:
        _currentIndex = 3;
       Navigator.push(context, MaterialPageRoute(builder: (_) => const Profile()));
        break;
    }
  },
),
      ),
  );
  }
}

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String _responseData = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Fetch data from the URL and store it in a variable
  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.43.213:5000/get_data'));

      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> data = jsonDecode(response.body);
          String values = data.values.join(", ");
          _responseData = values;
          if (_responseData == "1")
          {
            _responseData = "Emergency!\nAlsion 2, Sonderborg\n" + DateTime.now().toString();
          } // Save response in variable
        });
      } else {
        setState(() {
          _responseData = "Failed to load data";
        });
      }
    } catch (e) {
      setState(() {
        _responseData = "Error occurred: $e";
      });
      print("Error: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color(0xffe0fbfc),
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: const Color(0xff9db4c0),
        titleTextStyle: const TextStyle(
          color: Color(0xffe0fbfc),
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
      body: Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Align(
      alignment: Alignment.topCenter,
      child: Text(
        _responseData,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    ),
  ),
            bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xff9db4c0),
      selectedItemColor: const Color(0xff253237),  
      unselectedItemColor: const Color(0xffe0fbfc),
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color:Color(0xffe0fbfc)),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined, color: Color(0xff253237)),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color:Color(0xffe0fbfc)),
      label: 'Profile',
    ),
  ],
  onTap: (int index) {
    switch (index) {
      case 0:
        _currentIndex = 1;
        Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
        break;
      case 1:
        _currentIndex = 2;
        Navigator.push(context, MaterialPageRoute(builder: (_) => Messages()));
        break;
      case 2:
        _currentIndex = 3;
       Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()));
        break;
    }
  },
),
      ),
  );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color(0xffe0fbfc),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xff9db4c0),
        titleTextStyle: const TextStyle(
          color: Color(0xffe0fbfc),
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
  bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff9db4c0),
      selectedItemColor: const Color(0xff253237),  
      unselectedItemColor: const Color(0xffe0fbfc),
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color:Color(0xffe0fbfc)),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined, color: Color(0xffe0fbfc)),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color:Color(0xff253237)),
      label: 'Profile',
    ),
  ],
  onTap: (int index) {
    switch (index) {
      case 0:
        _currentIndex = 1;
        Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
        break;
      case 1:
        _currentIndex = 2;
        Navigator.push(context, MaterialPageRoute(builder: (_) => Messages()));
        break;
      case 2:
        _currentIndex = 3;
       Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()));
        break;
    }
  },
),
body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '   Logged in as:\nViktorio Milanov',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Icon(Icons.person, size: 169),
          ],
        ),
      ),
      ),
  );
  }
}