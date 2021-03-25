import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Appointment'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.Column}) : super(key: key);


  final String title;
  final Widget Column;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState(){
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  String valueChoose;
  String valueChoose1;
  List ListItem = ['User 1' , 'User 2', 'User 3', 'User 4', 'User 5'];
  List ListItem1 = ['RT-PCR','RNA TESTS','ANTIGEN TESTS'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:<Widget> [
              // SizedBox(
              //   height:50,
              // ),
              Container(
                // width: double.infinity,
                // height: 160,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15),), ),
                // child:Container(
                  child: Image.asset('images/covid.jpg')
                ),

              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                child: Container(
                  padding: EdgeInsets.only(left:16,right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green,width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select User'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    // style: TextStyle(
                    //
                    // ),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose=newValue;
                        print(valueChoose);
                      });
                    },
                    items: ListItem.map((valueItem){
                      return DropdownMenuItem(
                      value:valueItem,
                      child: Text(valueItem),);
                    }
                  ).toList(),
                  ),
                ), ),

              // SizedBox(
              //   height:10,
              // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:12, horizontal: 16),
                    child: Container(
                      child: ListTile(
                        title: Text("Date: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}"),
                        trailing: Icon(Icons.keyboard_arrow_down),
                        leading: Icon(Icons.calendar_today),
                        onTap: _pickDate,
                      ),
                    ),
                  ),

              // SizedBox(
              //   height:10,
              // ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:12, horizontal: 16),
                      child: Container(
                        child: ListTile(
                          title: Text("Time: ${time.hour} : ${time.minute}"),
                          trailing: Icon(Icons.keyboard_arrow_down),
                            leading: Icon(Icons.timeline),
                            onTap: _pickTime,
                          ),
                      ),
                    ),

              // SizedBox(
              //   height:10,
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:12,horizontal: 16),
                child: Container(
                  padding: EdgeInsets.only(left:16,right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green,width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text('Select COVID-19 Tests'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    // style: TextStyle(
                    //
                    // ),
                    value: valueChoose1,
                    onChanged: (newValue1) {
                      setState(() {
                        valueChoose1=newValue1;
                        print(valueChoose1);
                      });
                    },
                    items: ListItem1.map((valueItem1){
                      return DropdownMenuItem(
                        value:valueItem1,
                        child: Text(valueItem1),);
                    }
                    ).toList(),
                  ),
                ),
              ),

              SizedBox(
                height:10,
              ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular((20),),),),
                        child: Text("Make an Appointment",
                        style: TextStyle(
                          color: Colors.white,
                        ),),

                        onPressed: (){},
                      ),
                    ),
                  ),
              ),
            ],
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
    ),
      ),);

  }
  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
      initialDate: pickedDate,
    );

    if (date != null)
      setState(() {
        pickedDate = date;
        print(pickedDate);
      });
  }
    _pickTime() async {
      TimeOfDay t = await showTimePicker(
        context: context,
        initialTime: time,
      );

      if (t != null)
        setState(() {
          time = t;
        });
}
}
