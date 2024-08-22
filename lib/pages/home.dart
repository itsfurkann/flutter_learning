import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set background

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.black38 : Colors.black54;

    return Scaffold(

      backgroundColor: bgColor,
      
      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgImage'), fit:BoxFit.cover)
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
            child: Column(
              children: <Widget>[

                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
                    },
                  icon: Icon(Icons.edit_location, color: Colors.amberAccent,),
                  label: Text('Edit Location', style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold, fontSize: 16),),

                ),
                SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 3,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 1,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 75,
                    fontWeight:  FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 5,

                  ),
                ),
              ],
            ),
          ),
        )
      ),
      
    );
  }
}
