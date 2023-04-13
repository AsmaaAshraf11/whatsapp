import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'shatScreen.dart';
import 'package:whatsapp/model/data_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class CallList extends StatefulWidget {
   CallList({super.key});

  @override
  State<CallList> createState() => _CallListState();
}

class _CallListState extends State<CallList> {
  
  //Future<List<People>>readJsonfile ();
  @override
  Widget build(BuildContext context) {
return  FutureBuilder<List<People>>(
      future: readJsonfile(),
      builder: (context, snapshot)
      {
      //error
      if(snapshot.hasError){
        return Center(
          child:Text('${snapshot.error}'),
        );

      }
      else if(snapshot.hasData){
        final lisyData=snapshot.data;

        return Container(
          child: ListView.builder(
              itemCount: lisyData?.length,
              itemBuilder: (context,index){
              return ListTile(leading: Container(
          width: 60,
          height: 60,
         decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(30),
         image: DecorationImage(
           image:NetworkImage( lisyData![index].photo.toString()),
           )
         ),
      
              ),
              title: Text( lisyData[index].name.toString()),
            subtitle: Row(children: [

              Icon(Icons.call_made_sharp,color: Colors.red,),
            Text(lisyData[index].time.toString()),

        
            ]),
              trailing: Icon(Icons.call,color:Color.fromARGB(255, 0, 150, 100)),
              );
            }),
        );
      }else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
      }
      }
    );
      
      }
      }
    
    
    
  
