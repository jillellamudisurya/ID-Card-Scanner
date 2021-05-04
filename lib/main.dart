import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
  ));
}
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title:Text('ID Card Scanner') ,
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
                'WELCOME',

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image.jpg'),
              radius: 60.0,
            ),
          ),
          Center(
            child: RaisedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Seclogin()));
                },
                icon: Icon(
                  Icons.login,
                ),
                label: Text(
                    'SECURITY',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              color: Colors.blue,
            ),
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image.jpg'),
              radius: 60.0,
            ),
          ),
          Center(
            child: RaisedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminlogin()));
                },
                icon: Icon(
                  Icons.login,
                ),
                label: Text(
                      'ADMIN',
                      style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                )
            ),
              color: Colors.blue,
          ),
          ),
        ],
      ),

    );
  }
}


class Seclogin extends StatefulWidget {

  @override
  _SecloginState createState() => _SecloginState();
}

class _SecloginState extends State<Seclogin> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height:30.0),
          Center(
              child: Text(
                  'SECURITY LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              )
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Form(

                key: formkey,
                child: TextFormField(

                  keyboardType: TextInputType.name,
                  obscureText: true,

                  validator: (String name){
                    if(name.isEmpty){
                      return "Required *";
                    }
                  },

                  decoration: InputDecoration(

                    labelText: 'Enter Name',
                    hintText: 'enter your name',
                    filled: true,
                    fillColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
                child: Form(
                  key: formkey1,
                  child: TextFormField(
                    validator: (String password){
                      if(password.isEmpty){
                        return "Required *";
                      }
                    },
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    decoration: InputDecoration(

                    labelText: 'Enter Password',
                    hintText: 'enter your password',
                    filled: true,
                    fillColor: Colors.grey,
                    suffixIcon: InkWell(
                        child: Icon(
                            Icons.visibility,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                    )
                    ),
                  ),
                ),
            ),
          Center(
            child: RaisedButton.icon(onPressed: (){
              if(formkey.currentState.validate()&&formkey1.currentState.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Secsuccess()));
              }
            },
                icon: Icon(
                  Icons.login_sharp,
                ),
                label: Text('Login'),
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }
}


class Adminlogin extends StatefulWidget {
  @override
  _AdminloginState createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height:30.0),
          Center(
              child: Text(
                'ADMIN LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              )
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Form(

                key: formkey,
                child: TextFormField(

                  keyboardType: TextInputType.name,
                  obscureText: true,

                  validator: (String name){
                    if(name.isEmpty){
                      return "Required *";
                    }
                  },

                  decoration: InputDecoration(

                      labelText: 'Enter Name',
                      hintText: 'enter your name',
                      filled: true,
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius:BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius:BorderRadius.all(Radius.circular(20)),
                      )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formkey1,
              child: TextFormField(
                validator: (String password){
                  if(password.isEmpty){
                    return "Required *";
                  }
                },
                keyboardType: TextInputType.name,
                obscureText: true,
                decoration: InputDecoration(

                    labelText: 'Enter Password',
                    hintText: 'enter your password',
                    filled: true,
                    fillColor: Colors.grey,
                    suffixIcon: InkWell(
                        child: Icon(
                          Icons.visibility,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    )
                ),
              ),
            ),
          ),
          Center(
            child: RaisedButton.icon(onPressed: (){
              if(formkey.currentState.validate()&&formkey1.currentState.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Adminsuccess()));
              }
            },
              icon: Icon(
                Icons.login_sharp,
              ),
              label: Text('Login'),
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }
}

class Secsuccess extends StatefulWidget {
  @override
  _SecsuccessState createState() => _SecsuccessState();
}

class _SecsuccessState extends State<Secsuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('ID Card Scanner'),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          elevation: 0.0,
        ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
                'SECURITY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                RaisedButton.icon(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Outing()));
                },
                    icon: Icon(Icons.call_missed_outgoing),
                    label: Text('Outing'),
                ),
                SizedBox(height: 30),

                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),
                RaisedButton.icon(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Leave()));
                },
                  icon: Icon(Icons.time_to_leave),
                  label: Text('Leave'),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}

class Adminsuccess extends StatefulWidget {
  @override
  _AdminsuccessState createState() => _AdminsuccessState();
}

class _AdminsuccessState extends State<Adminsuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'ADMIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                RaisedButton.icon(onPressed: (){},
                  icon: Icon(Icons.stacked_bar_chart),
                  label: Text('Outing Statistics'),
                ),
                SizedBox(height: 30),

                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),
                RaisedButton.icon(onPressed: (){},
                  icon: Icon(Icons.stacked_bar_chart),
                  label: Text('Leave Statistics'),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}

class Outing extends StatefulWidget {
  @override
  _OutingState createState() => _OutingState();
}

class _OutingState extends State<Outing> {
  String barcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'OUTING',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                RaisedButton.icon(onPressed: (){},
                  icon: Icon(Icons.arrow_back),
                  label: Text('IN'),
                ),
                SizedBox(height: 30),

                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                Text(
                  '$barcode',
                ),
                RaisedButton.icon(onPressed: scanBarcode,
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Out'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Future<void> scanBarcode() async {
    try{
      final barcode = await FlutterBarcodeScanner.scanBarcode("#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException{
      barcode = ' Failed to get platform version';
    }
  }
}

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'LEAVE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                RaisedButton.icon(onPressed: (){},
                  icon: Icon(Icons.arrow_back),
                  label: Text('IN'),
                ),
                SizedBox(height: 30),

                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),
                RaisedButton.icon(onPressed: (){},
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Out'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class barcodetext extends StatefulWidget {
  @override
  _barcodetextState createState() => _barcodetextState();
}

class _barcodetextState extends State<barcodetext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),
    );
  }
}







