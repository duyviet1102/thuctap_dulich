import 'package:doctorcareapp/firebase_auth_services.dart';
import 'package:doctorcareapp/pages/page_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ultils/colors.dart';
import '../ultils/dimensions.dart';
import '../widgets/text_widgets/middle_text.dart';
import '../widgets/text_widgets/small_text.dart';

class PageSignUp extends StatefulWidget {
  final TextEditingController _textController = TextEditingController();

  PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _SignUpState();
}

class _SignUpState extends State<PageSignUp> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _email = "";
  String _password = "";
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brgLoginColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimentions.width10*2, right: Dimentions.width10*2,
              top: Dimentions.height120, bottom: Dimentions.height40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: Dimentions.height10*2),
                      color: Colors.red,
                      height: Dimentions.height40,
                      width: Dimentions.width10*10,
                    ),
                    MiddleText(text: "Welcome to Doctor Care", size: Dimentions.font11*2,),
                    SizedBox(height: Dimentions.height10,),
                    SmallText(text: "Đăng kí để tiếp tục", color: Colors.white, size: Dimentions.font16,),
                  ],
                ),
                SizedBox(height: Dimentions.height40,),
                Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      maxLines: 1,
                      style: TextStyle(fontSize: Dimentions.font16),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: Dimentions.height10/2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(Dimentions.radius10/2)
                        ),
                        filled: true,
                        fillColor: wcolor,
                        hintText: "Họ và tên",
                        hintStyle: TextStyle(fontSize: Dimentions.font14, color: bcolor.withOpacity(0.4)),
                        prefixIcon: Icon(Icons.person_outline_outlined,color: bcolor.withOpacity(0.5), size: Dimentions.font20,),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: bcolor.withOpacity(0.5)),
                          iconSize: Dimentions.font20,
                          onPressed: (){},
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height10,),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Vui lòng nhập Email";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          _email = value;
                        });
                      },
                      maxLines: 1,
                      style: TextStyle(fontSize: Dimentions.font16),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: Dimentions.height10/2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(Dimentions.radius10/2)
                        ),
                        filled: true,
                        fillColor: wcolor,
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: Dimentions.font14, color: bcolor.withOpacity(0.4)),
                        prefixIcon: Icon(Icons.email_outlined,color: bcolor.withOpacity(0.5), size: Dimentions.font20,),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: bcolor.withOpacity(0.5)),
                          iconSize: Dimentions.font20,
                          onPressed: (){},
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height10,),
                    TextFormField(
                      controller: _passController,
                      obscureText: true,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Vui lòng nhập Mật khẩu";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          _password = value;
                        });
                      },
                      maxLines: 1,
                      style: TextStyle(fontSize: Dimentions.font16),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: Dimentions.height10/2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(Dimentions.radius10/2)
                        ),
                        filled: true,
                        fillColor: wcolor,
                        hintText: "Mật khẩu",
                        hintStyle: TextStyle(fontSize: Dimentions.font14, color: bcolor.withOpacity(0.4)),
                        prefixIcon: Icon(Icons.lock_outline,color: bcolor.withOpacity(0.5), size: Dimentions.font20,),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye_outlined, color: bcolor.withOpacity(0.5),),
                          iconSize: Dimentions.font20,
                          onPressed: (){},
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height10,),
                    TextField(
                      maxLines: 1,
                      style: TextStyle(fontSize: Dimentions.font16),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: Dimentions.height10/2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(Dimentions.radius10/2)
                        ),
                        filled: true,
                        fillColor: wcolor,
                        hintText: "Xác nhận mật khẩu",
                        hintStyle: TextStyle(fontSize: Dimentions.font14, color: bcolor.withOpacity(0.4)),
                        prefixIcon: Icon(Icons.lock_outline,color: bcolor.withOpacity(0.5), size: Dimentions.font20,),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye_outlined, color: bcolor.withOpacity(0.5),),
                          iconSize: Dimentions.font20,
                          onPressed: (){},
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height40,),
                    ConstrainedBox(
                      constraints:
                      BoxConstraints.tightFor(height: Dimentions.height25*2),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Dimentions.radius10)
                            ),
                          ),
                          onPressed: (){
                            _signUp();
                          },
                          child: Center(child: MiddleText(text: "Đăng Kí", size: Dimentions.font18, color: btnTextColorLogSign,))
                      ),
                    ),
                    SizedBox(height: Dimentions.height120,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallText(text: "Bạn đã có tài khoản? ", size: Dimentions.font16, color: wcolor,),
                        TextButton(
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => PageLogin())),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.only(right: Dimentions.width10),
                              ),
                            ),
                            child: MiddleText(text: "Đăng nhập", size: Dimentions.font16, color: wcolor,))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
  void _signUp() async{
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passController.text;

    User? user = await _authService.signUpWithEmailAndPassword( username ,email, password);
    
    if(user != null){
      print("Đăng kí thành công!");
      Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => PageLogin(),
        ),
      );
    }else{
      print("Đăng kí thất bại");
    }
  }
}
