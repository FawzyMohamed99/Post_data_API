abstract class AuthStates {}
class AuthInitialState extends AuthStates{}
class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class RegisterFailureState extends AuthStates{}