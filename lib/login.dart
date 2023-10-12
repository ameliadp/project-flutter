import 'package:flutter/material.dart';
import 'package:project_sec4/homePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 70),
                    ),
                    Image.asset(
                      'assets/images/pink-a.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'A Cosme',
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Color(0xff3ea4b5),
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ],
                        color: Color(0xff8DD5E0),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 7,
                margin: EdgeInsets.only(top: 30),
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3ea4b5)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: TextField(
                          obscureText: _secureText,
                          autocorrect: false,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showHide(); 
                              }, 
                              icon: Icon(
                                _secureText ?Icons.visibility_off : Icons.visibility,
                                color: _secureText ? Colors.grey: Color(0xff3ea4b5)),
                              ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3ea4b5)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: const Text(
                              'Lupa Password?',
                              style: TextStyle(
                                color: Color(0xff61b2e8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              color: Color(0xff3ea4b5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),
                                ),
                              );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ), 
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: const Text(
                              'Belum Punya Akun?Buat Akun!',
                              style: TextStyle(
                                color: Color(0xff61b2e8)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top:5 ),
                            child: const Text(
                              'Atau Masuk Dengan Akun Google',
                              style: TextStyle(
                                color: Color(0xff61b2e8)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
