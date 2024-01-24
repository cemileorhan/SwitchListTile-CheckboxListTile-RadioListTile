import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Check Box- Radio List Tile Sample"),
        ),
        body: TextSample(),
      ),
    );
  }
}
class TextSample extends StatefulWidget {
  @override
  _TextSample createState() => _TextSample();
}
class _TextSample extends State<TextSample> {
bool isbookchecked = false, istheatrechecked = false, ismusicchecked = false;
bool isradioyellowchecked = false, isradiobluechecked = false, isradiogreenchecked = false;
String radiocolors="";
late Color contcol=Colors.grey;
String checkedtext = "Hobbies: ";
bool switchstate=false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
              Text("Choose your hobbies", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(switchstate?"Good Morning":"Good Night", style: TextStyle(color: switchstate?Colors.pink:Colors.black),),
            SwitchListTile(
                value: switchstate,
                secondary: Icon(Icons.add_alarm),
                onChanged: (val){
                  setState(() {
                    switchstate=val;
                  });
                },
              title: Text(switchstate?"Open":"Close"),
            ),
            CheckboxListTile(
              value: isbookchecked,
              onChanged: (value){
                setState(() {
                  isbookchecked=value!;
                });
              },
              title: Text("Reading books",style: TextStyle(color: Colors.green),),
              activeColor: Colors.blue,
              checkColor: Colors.red,
            ),
            CheckboxListTile(
              value: istheatrechecked,
              onChanged: (value){
                setState(() {
                  istheatrechecked=value!;
                });
              },
              title: Text("Going to theatre",style: TextStyle(color: Colors.green),),
              activeColor: Colors.blue,
              checkColor: Colors.red,
            ),
            CheckboxListTile(
              value: ismusicchecked,
              onChanged: (value){
                setState(() {
                  ismusicchecked=value!;
                });
              },
              title: Text("Listening to music",style: TextStyle(color: Colors.green),),
              activeColor: Colors.blue,
              checkColor: Colors.red,
            ),
            RadioListTile(
                selected: isradioyellowchecked,
                title: Text("Yellow Radio"),
                value: 'yellow',
                groupValue: radiocolors,
                onChanged: (vvv){ //vvv olan yere ne istersen yaz
                  setState(() {
                    isradioyellowchecked=true;
                    radiocolors=vvv!;
                    contcol=Colors.yellow; //aktif renk
                  });
                },
                activeColor: Colors.yellow,
            ),
            RadioListTile(
              selected: isradiobluechecked,
              title: Text("Blue Radio"),
              value: 'blue',
              groupValue: radiocolors,
              onChanged: (vvv){ //vvv olan yere ne istersen yaz
                setState(() {
                  isradiobluechecked=true;
                  radiocolors=vvv!;
                  contcol=Colors.blue; //aktif renk
                });
              },
              activeColor: Colors.blue,
            ),
            RadioListTile(
              selected: isradiogreenchecked,
              title: Text("Green Radio"),
              value: 'green',
              groupValue: radiocolors,
              onChanged: (vvv){ //vvv olan yere ne istersen yaz
                setState(() {
                  isradiogreenchecked=true;
                  radiocolors=vvv!;
                  contcol=Colors.green; //aktif renk
                });
              },
              activeColor: Colors.green,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  checkedtext="Hobbies: ";
                  if(isbookchecked)
                    setState(() {
                      checkedtext= checkedtext+" Reading books";
                    });
                  if(ismusicchecked)
                    setState(() {
                      checkedtext= checkedtext+" Listening to music";
                    });
                  if(istheatrechecked)
                    setState(() {
                      checkedtext= checkedtext+" Going to theatre";
                    });
                },
                child: Text("Show Hobbies",style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 5,),
            Container(height: 200, width: 200,
              child: Text(checkedtext, style: TextStyle(backgroundColor: contcol, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            ),
          ],
        ),
    );
  }
}