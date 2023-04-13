import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:whatsapp/model/data_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class ChatList extends StatefulWidget {
   ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
 

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
              Icon(Icons.done_all,color: Colors.blue,),
          Expanded(
          child: Text(lisyData[index].description.toString(),maxLines: 1,),
          )
        
            ]),
              trailing: Text(lisyData[index].time.toString()),
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
 Future<List<People>>readJsonfile ()async{

final response= await rootBundle.loadString('assets/json_file/data.json');
final  data=await json.decode(response) as Map<String,dynamic>;
final List<dynamic>lisyData=data['people'];
   return lisyData.map((item)=>People.fromJson(item)).toList();
  
}