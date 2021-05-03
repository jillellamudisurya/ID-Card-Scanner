import 'package:flutter/material.dart';

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

  void validate(){
    if(formkey.currentState.validate()){
      print("Validate");
    }
    else{
      print("Not Validated");
    }
  }

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
                      borderSide: BorderSide(color: Colors.red),
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
                  child: TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return "Required";
                      }
                      else{
                        return null;
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
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                    )
                    ),
                  ),
                ),
            ),
          Center(
            child: RaisedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Secsuccess()));
              validate();
            },
                icon: Icon(
                  Icons.login_sharp,
                ),
                label: Text('Login'),
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 30.0,),
          //Row(
            //children: [
              //Center(
                  //child: Text(
                      //'Dont have an account? ',
                    //style: TextStyle(
                      //fontSize: 15.0,
                      //color: Colors.grey,
                    //  fontWeight: FontWeight.bold,
                  //  ),
                //  )
              //),
              //Center(
                //child: RaisedButton.icon(onPressed: (){},
                    //icon: Icon(
                     // Icons.account_box,
                    //),
                   // label: Text('Sign Up'),
                 // color: Colors.blue,
               // ),
             // ),
           // ],
         // ),
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
          SizedBox(height:30),
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
          SizedBox(height:30),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: TextField(
                keyboardType: TextInputType.name,
                obscureText: true,
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
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
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
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                  )
              ),
            ),
          ),
          SizedBox(height:30),
          Center(
            child:
            RaisedButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminsuccess()));
              },
              icon: Icon(
                Icons.login_sharp,
              ),
              label: Text('Login'),
              color: Colors.blue,
            ),
          ),
          SizedBox(height:30),
          //Row(
            //children: [
              //Center(
                  //child: Text(
                    //'Dont have an account? ',
                    //style: TextStyle(
                      //fontSize: 15.0,
                      //color: Colors.grey,
                    //  fontWeight: FontWeight.bold,
                  //  ),
                //  )
              //),
              //Center(
                //child: RaisedButton.icon(onPressed: (){},
                  //icon: Icon(
                    //Icons.account_box,
                  //),
                  //label: Text('Sign Up'),
                  //color: Colors.blue,
                //),
              //),
            //],
          //),
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

class Outing extends StatelessWidget {
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

class Leave extends StatelessWidget {
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






