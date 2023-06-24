
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prod_mobile/src/repositories/authentication/authentication.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:prod_mobile/src/routers/application.dart';
part 'home.state.dart';
class HomeControllner extends Cubit<HomeState>{
  final AuthenticationRepository _authenticationRepository;
  HomeControllner(
      this._authenticationRepository) : super(HomeInitial()){}


  Future<void> init() async{
    await Future.wait([
      loadProfile(),
    ]);
  }

  Future<void> loadProfile() async {

  }




}