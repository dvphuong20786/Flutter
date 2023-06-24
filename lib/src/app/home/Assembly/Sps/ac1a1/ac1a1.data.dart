

import 'package:flutter/cupertino.dart';
import 'package:prod_mobile/src/app/home/Assembly/aseembly.module.dart';
import 'package:prod_mobile/src/models/aseembly/sps/ac1a1.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:prod_mobile/src/models/aseembly/sps/ac1a1_.dart';
import 'package:prod_mobile/src/models/aseembly/sps/ac1a1_list.dart';
import 'package:prod_mobile/src/repositories/aseembly/aseembly.repository.dart';
part 'ac1a1.state.dart';
class Ac1a1Data extends Cubit<ac1a1State>{
  late final AseemblyRepository _aseemblyRepository;
  List<Ac1a1> data = <Ac1a1>[];

  Ac1a1Data(this._aseemblyRepository) : super(ac1a1Initial()){
    //loadData();
  }

  Future<void> loadData() async {
    Map<String, dynamic> params = {};
    Map<String, dynamic> params1= {};

    try{
      Ac1a1_List ac1a1 = (await _aseemblyRepository.fetchAc1a1(params)) as Ac1a1_List;
      Ac1a1_ processList = await _aseemblyRepository.ProcessList(params1);

      String? _process = ac1a1.Ac1a1List?.first.process;
      String? chuoi = processList.processList;//T3,T4,T5
      print(_process);
      if(chuoi?.indexOf(_process!) != -1){
          data = ac1a1.Ac1a1List!;

      }
    }on Exception {
      emit(DailyCalendarError("Error Changin data"));
    }
  }


}