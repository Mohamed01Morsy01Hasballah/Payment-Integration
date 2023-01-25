import 'package:flutter/material.dart';
import 'package:payment/shared/endpoints.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../shared/component/component.dart';
import 'RegisterScreen.dart';

class OnlineCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(onPressed: () {
          navigateFininsh(context: context, Widget: RegisterScreen());
        }, icon: Icon(Icons.exit_to_app)),
      ),

      body: WebView(
        initialUrl: 'https://accept.paymob.com/api/acceptance/iframes/724735?payment_token=$FinallToken',
        javascriptMode: JavascriptMode.unrestricted,

        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}