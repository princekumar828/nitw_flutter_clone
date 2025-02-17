import 'package:flutter/material.dart';
import 'package:nitw/directorMessage.dart';
import 'package:nitw/footer.dart';
import 'package:nitw/gridSection.dart';
import 'package:nitw/herosection.dart';
import 'package:nitw/notic.dart';
import 'package:nitw/noticeMarque.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NITW Clone',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/nitwlogo.png', // Add the NIT logo
              height: 50,
              width: 50,
            ),
            SizedBox(width: 5),
            Text(
              " Nitw App",
              style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(title: Text('Home'), leading: Icon(Icons.home)),
            ListTile(title: Text('Departments'), leading: Icon(Icons.school)),
            ListTile(title: Text('About Us'), leading: Icon(Icons.info)),
            ListTile(title: Text('Contact'), leading: Icon(Icons.contact_mail)),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSection(),
            Notic(),
            Directormessage(),
            NoticeMarquee(notices: [
              "Welcome to our app! Stay tuned for updates.",
              "New feature: Dark mode is now available 🌙.",
              "Don't miss our special discount this weekend!",
            ], ),
            Gridsection(),
            Footer(),
          ],
        ),
      ),
    );
    
  }
}
