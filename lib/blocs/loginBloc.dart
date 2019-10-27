import 'dart:async';
import '../validators/validators.dart';
class Bloc extends Object with Validate{

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  // bloc sink controller
  get changeEmail => _emailController.sink.add;
  get changePassword => _passwordController.sink.add;

  // bloc stream validate controller
  get emailValidate => _emailController.stream.transform(validateEmail);
  get passwordValidate => _passwordController.stream.transform(validatePassword);

//bloc stream listener

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}