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
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.grey[500],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.black,  
      unselectedItemColor: Colors.grey[500],
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color:Colors.black),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined, color: Colors.grey[500]),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color:Colors.grey[500]),
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
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Colors.grey[500],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
            bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,  
          unselectedItemColor: Colors.grey[500],
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color:Colors.grey[500]),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined, color: Colors.black),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color:Colors.grey[500]),
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
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.grey[500],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
  bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,  
          unselectedItemColor: Colors.grey[500],
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color:Colors.grey[500]),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined, color: Colors.grey[500]),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color:Colors.black),
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