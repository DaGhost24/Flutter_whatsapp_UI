import 'package:flutter/material.dart';
import 'package:whatsapp/utils/chatItems.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return DefaultTabController (
      initialIndex: 1,
      length: 4,
      child: Scaffold (
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          backgroundColor: Color(0xff00cc3f),
          child: Icon(Icons.chat),
        ),
        appBar: AppBar (
          backgroundColor: Color(0xff075e55),
          centerTitle: false,
          title: Text (
            "WhatsApp", style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS"
              ),
              Tab(
                text: "Status"
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
          actions: [
            Icon(Icons.search, size: 30.0),
            const SizedBox(width: 16.0),
            Icon(Icons.more_vert, size: 30.0),
            const SizedBox(width: 16.0),

          ],
        ),
        body: ListView(
          itemExtent: 80.0,
          children: chatItems,
        ),
      ),
    );
  }
}

class ChatItems extends StatelessWidget {
  final String name;
  final String image;
  final String text;
  final DateTime time;

  const ChatItems({
    Key? key,
    required this.name,
    required this.image,
    required this.text,
    required this.time,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            child: ListTile(
              leading: SizedBox(
                height: 80.0,
                child: ClipRRect (
                  borderRadius: BorderRadius.circular(200.0),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold,),
              ),
              subtitle: Text(text),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${time.hour}: ${time.minute}")
                ],
              ),
            ),
        ),
        Container(
          color: Colors.grey[300],
          height: 1,
          width: MediaQuery.of(context).size.width - 85.0,
        )
      ],
    );
  }
}
