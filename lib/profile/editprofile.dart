import 'package:flutter/material.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  static const String _title = 'Blink';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    //  title: _title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
          backgroundColor: Color.fromARGB(243, 250, 248, 255),
       // appBar: AppBar(title: const Text(_title),),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background circle
          Positioned(
            top:70,
            right:30,
            left: 30,
            
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
               width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          
          Positioned(
            top:70,
            right:20,
              
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 40, 0),
               width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple[50],
              ),
            ),
          ),
          // Signup form
               Positioned(
                
            top:130,
            left: 0,
            right: 0,
             child: Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 40, 0),
               width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple[50],
              ),
            ),
          ),
          // Signup form
             
          Positioned(
            top: 250,
            left: 30,
            right: 30,
             child: Column(
              children:<Widget> [
                 Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
            alignment: Alignment.centerLeft,
              child: const Text(
                'User Name',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ) ,),
            Container(
            decoration:  BoxDecoration(   
            color: Color.fromARGB(255, 249, 247, 247),
            borderRadius: new BorderRadius.circular(10.0), 
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),
            ]),
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
   
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 10.0, 2.0, 10.0),
                  enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
                    ),
                  labelText: 'User Name',
                  // fillColor: Color.fromARGB(255, 249, 247, 247),
                  // filled: true,
                  
                ),
              ),
            ),

                 Container(
             padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
             alignment: Alignment.centerLeft,
              child: const Text(
                'Email',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ) ,),
            Container(
           decoration:  BoxDecoration(   
          color: Color.fromARGB(255, 249, 247, 247),
          borderRadius: new BorderRadius.circular(10.0),   
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
          ]),
               margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))),
                  labelText: 'example@email.com',
                   fillColor: Color.fromARGB(255, 249, 247, 247),
                  filled: true,
                ),
              ),
            ),
             Container(
             padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
             alignment: Alignment.centerLeft,
              child: const Text(
                'Phone Number',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ) ,),
            Container(
           decoration:  BoxDecoration(   
          color: Color.fromARGB(255, 249, 247, 247),
          borderRadius: new BorderRadius.circular(10.0),   
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
          ]),
               margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))),
                  labelText: '+251 00 000 0000',
                   fillColor: Color.fromARGB(255, 249, 247, 247),
                  filled: true,
                ),
              ),
            ),
             Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Password',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ) ,),
            Container(
            decoration:  BoxDecoration(   
          color: Color.fromARGB(255, 249, 247, 247),
          borderRadius: new BorderRadius.circular(10.0), 
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
          ]),
               margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
                  ),
                  labelText: 'Password',
                   fillColor: Color.fromARGB(255, 249, 247, 247),
                  filled: true,
                ),
              ),
            ),

          
  
            // TextButton(
            //   onPressed: () {
            //     //forgot password screen
            //   },
            //   child: const Text('Forgot Password',),
            // ),
            Container(
                   decoration:  BoxDecoration(   
          color: Color.fromARGB(255, 249, 247, 247),
          borderRadius: new BorderRadius.circular(5.0), 
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
          ]),
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                height: 45,
                width: double.infinity,
                
               

                child: ElevatedButton(
                  child: const Text(
                    'Save',),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    print(emailController.text);
                  },
                )
            ),
            
           
                // Text(
                //   'Sign Up',
                //   style: TextStyle(
                //     fontSize: 32,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 30),
                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: 'Email',
                //     prefixIcon: Icon(Icons.email),
                //   ),
                // ),
                // SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: 'Password',
                //     prefixIcon: Icon(Icons.lock),
                //   ),
                //   obscureText: true,
                // ),
                // SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text('Sign Up'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
 
   }
}