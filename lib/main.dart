import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: SharePrefrence(),));
}
class SharePrefrence extends StatefulWidget {
  const SharePrefrence({Key? key}) : super(key: key);

  @override
  State<SharePrefrence> createState() => _SharePrefrenceState();
}

class _SharePrefrenceState extends State<SharePrefrence> {

  SharedPreferences? prefs;

    int Textt = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    men();
  }
  Future<void> men() async {
    prefs = await SharedPreferences.getInstance();
    Textt = prefs!.getInt("KEY")??0;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("${Textt}"),
              ElevatedButton(onPressed: () {
                setState(() {
                  Textt++;
                  prefs!.setInt("KEY", Textt);
                });
              }, child: Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
