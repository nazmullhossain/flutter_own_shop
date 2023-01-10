import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/services/auth_services.dart';

import '../../const/global_varriable.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_text_field.dart';
enum Auth{
  signin,
  signup
}
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String routeName="/auth-screen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth=Auth.signup;
  final _signUpFormKey=GlobalKey<FormState>();
  final _signInFormKey=GlobalKey<FormState>();
  final AuthServices authServices=AuthServices();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _nameController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  void signUpUser(){
    authServices.signupUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text, );
  }
  void signInUser(){
    authServices.signInUser(context: context, email: _emailController.text, password: _passwordController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              const Text("Welcome",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
          ListTile(
              tileColor: _auth==Auth.signup?
              GlobalVariables.backGroundColor:
                  GlobalVariables.greyBackgroundColor,
              title: const Text("Create Account",style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth?val){
                  setState(() {
                    _auth=val!;
                  });
                },
              ),
          ),
          if(_auth==Auth.signup)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backGroundColor,
                child: Form(
                  key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomField(
                            controller: _nameController,
                            hintText: "Name"),
                        SizedBox(height: 10,),
                        CustomField(
                            controller: _emailController,
                            hintText: "email"),
                        SizedBox(height: 10,),
                        CustomField(
                            controller: _passwordController,
                            hintText: "password"),
                        SizedBox(height: 10,),
                        CustomButtonWidget(
                          text: 'Sign Up', onTap: () {
                            if(_signUpFormKey.currentState!.validate()){
                              signUpUser();
                            }
                        },)
                ],)),
              ),
          ListTile(
              tileColor: _auth==Auth.signin?
              GlobalVariables.backGroundColor:
              GlobalVariables.greyBackgroundColor,
              title: const Text("Sign In",style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth?val){
                  setState(() {
                    _auth=val!;
                  });
                },
              ),
          ),
          if(_auth==Auth.signin)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backGroundColor,
                child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [

                        CustomField(
                            controller: _emailController,
                            hintText: "email"),
                        SizedBox(height: 10,),
                        CustomField(
                            controller: _passwordController,
                            hintText: "password"),
                        SizedBox(height: 10,),
                        CustomButtonWidget(
                          text: 'Sign in', onTap: () {
                          if(_signInFormKey.currentState!.validate()){
                            signInUser();
                          }
                        },)
                      ],)),
              ),
        ],
      ),
            ),
          )),
    );
  }
}
