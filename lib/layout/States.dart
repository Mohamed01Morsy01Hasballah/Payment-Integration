abstract class PaymentStates{}
class initialState extends PaymentStates{}
class FirstTokenSuccessState extends PaymentStates{}
class FirstTokenErrorState extends PaymentStates{}
class orderTokenSuccessState extends PaymentStates{}
class orderTokenErrorState extends PaymentStates{}
class FinalTokenLadingState extends PaymentStates{}
class FinalTokenSuccessState extends PaymentStates{}
class FinalTokenErrorState extends PaymentStates{}
class ReFCodeSuccessState extends PaymentStates{}
class ReFCodeErrorState extends PaymentStates{}