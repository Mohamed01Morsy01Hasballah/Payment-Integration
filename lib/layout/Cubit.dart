import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/layout/States.dart';
import 'package:payment/shared/DioHelper.dart';
import 'package:payment/shared/endpoints.dart';

class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit():super(initialState());
  static PaymentCubit get(context) =>BlocProvider.of(context);
  //online Card
 Future<void> GetFirstToken()async{
   DioHelper.PostData(
       url: 'auth/tokens',
     data: {
         'api_key':apikey
     }

   ).then((value) {
     emit(FirstTokenSuccessState());
     paymobToken=value.data['token'].toString();
     print('paymobTokenFirst ${paymobToken}');
   }).catchError((error){
     emit(FirstTokenErrorState());
     print('error first ${error}');
   });
 }
 Future OrderToken(String price,String fname,String Lname,String email,String phone)async{
   DioHelper.PostData(
       url: 'ecommerce/orders',
       data: {
         'auth_token':paymobToken,
         "delivery_needed": false,
         "amount_cents": price,
         "currency": "EGP",
         'items':[]
       }
   ).then((value) {
     print('hello');
     emit(orderTokenSuccessState());
     paymobOrderId=value.data['id'].toString();
     print('paymobOrderId $paymobOrderId');
     FinalToken(price, fname, Lname, email, phone);

   }).
   catchError((error){
     emit(orderTokenErrorState());
     print('orror order ${error}');
   });
 }
 Future FinalToken(String price,String fname,String Lname,String email,String phone )async{
   emit(FinalTokenLadingState());
   DioHelper.PostData(
       url: 'acceptance/payment_keys',
       data: {
         "auth_token": paymobToken,
         "amount_cents": price,
         "expiration": 3600,
         "order_id": paymobOrderId,
         "billing_data": {
           "apartment": "NA",
           "email": email,
           "floor": "NA",
           "first_name": fname,
           "street": "NA",
           "building": "NA",
           "phone_number": phone,
           "shipping_method": "NA",
           "postal_code": "NA",
           "city": "NA",
           "country": "NA",
           "last_name": Lname,
           "state": "NA"
         },
         "currency": "EGP",
         "integration_id": IntegrationCard,
         "lock_order_when_paid": "false"
       }
   ).then((value) {
     emit(FinalTokenSuccessState());
     FinallToken=value.data['token'].toString();
     GetCodeRef();
     print('final Token ${FinallToken}');

   }).catchError((error){
     emit(FinalTokenErrorState());
     print('error final ${error}');
   });
 }
 Future GetCodeRef()async{
   DioHelper.PostData(
       url: 'acceptance/payments/pay',
       data: {

           "source": {
             "identifier": "AGGREGATOR",
             "subtype": "AGGREGATOR"
           },
           "payment_token": FinallToken

       }
   ).then((value) {
     emit(ReFCodeSuccessState());
     RefCode=value.data['id'].toString();
   }).catchError((error){
     emit(ReFCodeErrorState());
     print('error RefCode $error');

   });
 }
}