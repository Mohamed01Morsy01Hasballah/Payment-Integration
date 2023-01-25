import 'package:flutter/material.dart';
import 'package:payment/modules/RegisterScreen.dart';

import '../shared/component/component.dart';
import '../shared/endpoints.dart';

class MobileWallet extends StatelessWidget {
  const MobileWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:IconButton(onPressed: (){
          navigateFininsh(context:context,Widget:RegisterScreen());
        }, icon: Icon(Icons.exit_to_app)) ,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You Should go to any market to pay ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          SizedBox(height: 15,),
          Text('This is reference code'),
          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 40,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
               color: Colors.grey[300]
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text('$RefCode', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
