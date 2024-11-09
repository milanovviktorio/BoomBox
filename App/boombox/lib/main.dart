import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xffe0fbfc),
      appBar: AppBar(
        title: const Text('BoomBox'),
        backgroundColor: Color(0xff9db4c0),
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
            Text(
              'Welcome to BoomBox!',
              style: TextStyle(fontSize: 24),
            ),
            Image.asset('assets/trust.png'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color(0xff9db4c0),
      selectedItemColor: Color(0xff253237),  
      unselectedItemColor: Color(0xffe0fbfc),
  items: [
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
       Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()));
        break;
    }
  },
),
      ),
  );
  }
}

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xffe0fbfc),
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Color(0xff9db4c0),
        titleTextStyle: const TextStyle(
          color: Color(0xffe0fbfc),
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
      body: Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Align(
      alignment: Alignment.topCenter,
      child: Text(
        'No Current Messages',
        style: TextStyle(fontSize: 24),
      ),
    ),
  ),
            bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff9db4c0),
      selectedItemColor: Color(0xff253237),  
      unselectedItemColor: Color(0xffe0fbfc),
  items: [
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
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xffe0fbfc),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Color(0xff9db4c0),
        titleTextStyle: const TextStyle(
          color: Color(0xffe0fbfc),
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
  bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff9db4c0),
      selectedItemColor: Color(0xff253237),  
      unselectedItemColor: Color(0xffe0fbfc),
  items: [
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
body: Center(
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