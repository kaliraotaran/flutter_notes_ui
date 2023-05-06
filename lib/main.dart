 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/note_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  // This widget is the root of your application.
int _selectedCategoryIndex =0;
late TabController _tabController;
final DateFormat _dateformatter = DateFormat('dd MM');
final DateFormat _timeformatter = DateFormat('h:mm');

@override
void initState(){
  super.initState();
  _tabController = TabController(length: 3, vsync: this, initialIndex:0);
}

Widget _builderCategoryCard(int index, String title, int count){
return GestureDetector(
  onTap: (){
    setState(() {
      _selectedCategoryIndex ==index;
    });
  },
  child:   Container(
      margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 240,
      width: 175,
      decoration: BoxDecoration(
        color: _selectedCategoryIndex == index ?
          Color(0xFF417BFB) : const Color(0xFFF5F7FB),

        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          _selectedCategoryIndex == index ?const BoxShadow(color:
           Colors.black26, offset: Offset(0,2), 
           blurRadius: 10) :
          const BoxShadow(color: Colors.transparent)
        ]
         
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Padding(padding:const EdgeInsets.all(20),
            child:Text(title, style:
             TextStyle(color: _selectedCategoryIndex == index?
              Colors.white : 
             const Color(0xFFAFB4C6),
            fontWeight: FontWeight.bold,
            fontSize: 27
             ),
          )
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Text(
                    count.toString(),
                    style: TextStyle(
                      color: _selectedCategoryIndex == index ? Colors.white : Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),

            ),
            )
        ],
        ),
  ),
);
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
          body: ListView(children:  <Widget>[
            const SizedBox(height: 30,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(children: [
                    Container(
                      height: 55,
                      width: 55,
                        decoration: BoxDecoration(
                          image:const DecorationImage(image: AssetImage('assets/images/user1.png'),
                             
                          ),
               borderRadius: BorderRadius.circular(15),
    
                        ),
    
                    ),
                   const SizedBox(width: 20,),
                   const Text('Jack\'s break',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
              ]),
            ),
           const SizedBox(height: 40,),
            Container(
              height: 280,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length + 1,
                  itemBuilder: (BuildContext context, int index){
                    if(index == 0){
                      return const SizedBox(width: 20,);

                    }
                    return _builderCategoryCard(index-1, categories.keys.toList()[index-1], categories.values.toList()[index-1] 
                    );
                  },

              ),
            ),
            Padding(
              padding:const EdgeInsets.all(10),
              child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor:const Color(0xFFAFB4C6),
              indicatorColor:const Color(0xFF417BFB),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4.0,
              isScrollable: true,
              tabs: const <Widget>[
                    Tab(
                      child: Text(
                        'Notes',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                     Tab(
                      child: Text(
                        'important',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                     Tab(
                      child: Text(
                        'performed',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                   
              ],
              ),
            ),
         const   SizedBox(height: 20,),
            Container(
                margin:const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(30),
                decoration:  BoxDecoration(
                  color:const Color(0xFFF5F7FB),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(children: <Widget>[
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Text(
                    notes[0].title,
                    style:const TextStyle(
                      color: Colors.black,
                     fontSize: 18,  
                     fontWeight: FontWeight.w600),
                  ),
                  Text(
                    _timeformatter.format(notes[0].date),
                    style:const TextStyle(
                      color: Color(0xFFAFB4C6),
                     fontSize: 18,  
                     fontWeight: FontWeight.w500),
                  )
                  ],
                  
                 ),
                 SizedBox(height: 15,),
                 Text(
                  notes[0].content,
                  style:const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                    ),
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        _dateformatter.format(notes[0].date),
                        style:const TextStyle(
                          color: Color(0xFFAFB4C6),
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF417BFB),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(Icons.location_on, color: Colors.white,),

                      )
                    ],
                  )
                ],
                ),
            ),
            SizedBox(height: 20,),
Container(
                margin:const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(30),
                decoration:  BoxDecoration(
                  color:const Color(0xFFF5F7FB),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(children: <Widget>[
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Text(
                    notes[1].title,
                    style:const TextStyle(
                      color: Colors.black,
                     fontSize: 18,  
                     fontWeight: FontWeight.w600),
                  ),
                  Text(
                    _timeformatter.format(notes[1].date),
                    style:const TextStyle(
                      color: Color(0xFFAFB4C6),
                     fontSize: 18,  
                     fontWeight: FontWeight.w500),
                  )
                  ],
                  
                 ),
                 SizedBox(height: 15,),
                 Text(
                  notes[1].content,
                  style:const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                    ),
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        _dateformatter.format(notes[1].date),
                        style:const TextStyle(
                          color: Color(0xFFAFB4C6),
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF417BFB),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Icon(Icons.location_on, color: Colors.white,),
                      
                        ),
                      )
                    ],
                  )
                ],
                ),
            ),

          ],
          ),
    
      ),
    );
  }
}


