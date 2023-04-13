import 'package:flutter/material.dart';

import '../widgets/callScreen.dart';
import '../widgets/shatScreen.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({super.key});


  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
int currentIndex=0;
  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController(

        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:Color.fromARGB(255, 0, 150, 100),
           title: const Text("WhatsApp"),
           actions: [
            IconButton(onPressed:(){}, icon: const Icon(Icons.search)),
            PopupMenuButton(itemBuilder: (context)=>[
                 PopupMenuItem(child:Text("New group"),),
                 PopupMenuItem(child:Text("New broadcast"),),
                   PopupMenuItem(child:Text("WhatsAPP Web"),),
                   PopupMenuItem(child:Text("Srarred message"),),
             


              PopupMenuItem(child:Text("settint"),
              value: "settint",
),
            
            ]),
          
           
           ],
           bottom:  TabBar(
       onTap: (index){
        setState(() {
          currentIndex=index;
       
        });
},
            tabs: <Widget>[
       Tab(icon: Icon(Icons.camera_alt),),
       Tab(text: "CHATE"),
       Tab(text: "STATUS"),
       Tab(text: "CALLS",),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            ),
          ),
          body: TabBarView(children: [
            Text(""),

            ChatList(),
            Text(""),
            CallList(),
          ]),
          floatingActionButton: currentIndex==3?Container(
            child: FloatingActionButton(onPressed: (){},
            child: Icon(Icons.call),
            backgroundColor:Color.fromARGB(255, 0, 150, 100),

            ),
          ):
          Container(
            child: FloatingActionButton(onPressed: (){},
            child: Icon(Icons.chat),
            backgroundColor:Color.fromARGB(255, 0, 150, 100),
            ),
          ),
        ),
      );
    
    
  }
}