import 'package:flutter/material.dart';

void main() => runApp(const SignUp());

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
            top: -30,
            right:-30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple[100],
              ),
            ),
          ),
          // Signup form
              Positioned(
            top: 100,
            left:0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple[100],
              ),
            ),
          ),
            Positioned(
            bottom:-100,
            left:-100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple[100],
              ),
            ),
          ),
          Positioned(
            top: 150,
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
             padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
             alignment: Alignment.centerLeft,
              child: const Text(
                'First Name',
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
                  labelText: 'First Name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
                   ),
                  fillColor: Color.fromARGB(255, 249, 247, 247),
                  filled: true,
                

                  ),
                 
                  
                ),
              ),
                 Container(
             padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
             alignment: Alignment.centerLeft,
              child: const Text(
                'Last Name',
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
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))),
                  labelText: 'Last Name',
                   fillColor: Color.fromARGB(255, 249, 247, 247),
                  filled: true,
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
             Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Confirm Password',
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
               margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder( 
                    borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))),
                  labelText: 'ConfirmPassword',
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
          borderRadius: new BorderRadius.circular(25.0), 
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
          ]),
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                height: 45,
                width: double.infinity,
                
               

                child: ElevatedButton(
                  child: const Text(
                    'Signup',),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    print(emailController.text);
                  },
                )
            ),
            
            Row(
              children: <Widget>[
                const Text('Already have an account?'),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
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