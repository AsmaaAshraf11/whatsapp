// import 'dart:convert';
// import 'package:flutter/material.dart';

// class Person {
//   final String name;
//   final String photo;
//   final int age;
//   final String description;
//   final String time;

//   Person({required this.name, required this.photo, required this.age, required this.description, required this.time});

//   factory Person.fromJson(Map<String, dynamic> json) {
//     return Person(
//       name: json['name'],
//       photo: json['photo'],
//       age: json['age'],
//       description: json['description'],
//       time: json['time'],
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   final String data = '''
//     {
//       "people": [
//         {
//           "name": "John Doe",
//           "photo": "https://randomuser.me/api/portraits/men/1.jpg",
//           "age": 25,
//           "description": "John is a software developer who loves coding and building apps.",
//           "time": "2023-04-02T22:20:00Z"
//         },
//         {
//           "name": "Jane Smith",
//           "photo": "https://randomuser.me/api/portraits/women/2.jpg",
//           "age": 30,
//           "description": "Jane is a teacher who loves educating children and making a difference in their lives.",
//           "time": "2023-04-02T22:20:00Z"
//         }
//       ]
//     }
//   ''';

//   @override
//   Widget build(BuildContext context) {
//     final jsonData = json.decode(data);
//     final peopleData = jsonData['people'] as List;

//     List<Person> people = peopleData.map((person) => Person.fromJson(person)).toList();

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('People List'),
//         ),
//         body: ListView.builder(
//           itemCount: people.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Image.network(people[index].photo),
//               title: Text(people[index].name),
//               subtitle: Text('Age: ${people[index].age}'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'dart:convert';
// import 'modules/widgets/appBar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:whatsapp_project/web_services/api.dart';

// void main() async {
//   runApp( const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

  //const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//             //   //assets\whatsapp02.json
//             appBar: BuildAppBar(),
//             floatingActionButton: const FloatingActionButton(
//               onPressed: null,
//               backgroundColor: Color.fromRGBO(0, 168, 132, 35),
//               child: Icon(Icons.chat),
//             ),
//             //.................................body....................//
//             body: FutureBuilder(
//               future: _loadJsonData(),
//               builder: (context, data) {
//          //.................................error....................//
//                 if (data.hasError) {
//                   return Center(
//                     child: Text('${data.error}'),
//                   );
//       //.................................success...................//
//                 } else if (data.hasData) {
//                   var items=data.data as Map<String,dynamic>;
//      //.....................listview..............
//                   return ListView.builder(itemBuilder: ((context, index) { 
//                     return  TabBarView(
//                       children: <Widget>[
//                         Scaffold(
//                           // ignore: unnecessary_string_interpolations
//                           body: Text("${items[index].name.toString()}"),
//                         ),
//                         const Center(
//                           child: Text("It's rainy here"),
//                         ),
//                         const Center(
//                           child:  Text("It's sunny here"),
//                         ),
//                        const  Center(
//                           child: Text("It's sunny here"),
//                         ),
//                       ],
//                     );
//                   }));
//                 }
//              //.................................loadig time...................//
//                 else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             )),
//       ),
//     );
//   }
// }

// Future<List<People>> _loadJsonData() async {
//   final jsonString = await rootBundle.loadString('assets/whatsapp02.json');
//   final listDataJason = json.decode(jsonString) as Map<String,dynamic>;
//   return listDataJason.entries.map((e) => People.fromJson(e.value)).toList();
// }
