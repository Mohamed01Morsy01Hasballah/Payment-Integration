import 'package:flutter/material.dart';
import 'package:payment/modules/Mobile%20Wallet.dart';
import 'package:payment/modules/OnlineCard.dart';
import 'package:payment/modules/WebViewScreen.dart';
import 'package:payment/shared/constants.dart';

import '../shared/component/component.dart';
import '../shared/endpoints.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(//5123456789012346
              child: InkWell(//4987654321098769
                onTap: (){
                  navigateFininsh(context: context,Widget: MobileWallet());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]
                  ),
                  child: Image.network(AppImages.visaImage),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                navigateFininsh(context: context,Widget: OnlineCard());
              },
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]
                  ),
                  child: Image.network(AppImages.refCodeImage),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
