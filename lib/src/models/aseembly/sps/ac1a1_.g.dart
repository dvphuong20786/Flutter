

part of 'ac1a1_.dart';

Ac1a1_ _$Ac1a1_FromJson(Map<String, dynamic> json){
  return Ac1a1_(
      processList: json['processList'] as String
  );
}

Map<String, dynamic> _$Ac1a1_ToJson(Ac1a1_ instance) => <String, dynamic>{
  'processList' : instance.processList
};