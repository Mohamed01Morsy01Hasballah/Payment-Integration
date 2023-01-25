import 'dart:math';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/layout/Cubit.dart';
import 'package:payment/layout/LayoutScreen.dart';
import 'package:payment/layout/States.dart';

import '../shared/component/component.dart';

class RegisterScreen extends StatelessWidget {
  var email=TextEditingController();
  var lname=TextEditingController();
  var fname=TextEditingController();
  var phone=TextEditingController();
  var price=TextEditingController();

  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit,PaymentStates>(
        listener: (context,state){
          if(state is FinalTokenSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
          }
        },
      builder: (context,state){
          var cubit=PaymentCubit.get(context);
        return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        BuiltTextField(
                            type: TextInputType.name,
                            controller: fname,
                            label: 'First Name',
                            prefix: Icons.person,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter Name ';
                              }
                              return null;

                            }
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        BuiltTextField(
                            type: TextInputType.name,
                            controller: lname,
                            label: 'Last Name',
                            prefix: Icons.person,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter name';
                              }
                              return null;

                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        BuiltTextField(
                            type: TextInputType.emailAddress,
                            controller: email,
                            label: 'Email',
                            prefix: Icons.email,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter Email Address';
                              }
                              return null;

                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BuiltTextField(
                            type: TextInputType.phone,
                            controller: phone,
                            label: 'phone',
                            prefix: Icons.phone,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter Phone ';
                              }
                              return null;

                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BuiltTextField(
                            type: TextInputType.phone,
                            controller: price,
                            label: 'Price',
                            prefix: Icons.money,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter price ';
                              }
                              return null;

                            }
                        ),
                        SizedBox(height: 20,),



                        ConditionalBuilder(
                            condition: state is! FinalTokenLadingState,
                            builder: (context)=> BuiltButton(
                                height: 50,
                                color: Colors.deepOrange,
                                text: 'Register',
                                function: (){
                                  if(formkey.currentState!.validate()) {
                                    cubit.OrderToken(
                                        price.text,
                                        fname.text,
                                        lname.text,
                                        email.text,
                                        phone.text
                                    );
                                  }

                                }
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator())
                        )


                      ],
                    ),
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}
