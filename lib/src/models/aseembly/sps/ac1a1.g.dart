
part of  'ac1a1.dart';

Ac1a1 _$Ac1a1FromJson(Map<String, dynamic> json){
  return Ac1a1(
    process: json['process'] as String,
    model: json['model'] as String,
    body: json['body'] as String,
    seqNo: json['seqNo'] as String,
  );
}

Map<String, dynamic> _$Ac1a1ToJson(Ac1a1 instance) => <String, dynamic>{
  'process' : instance.process,
  'model' : instance.model,
  'body' : instance.body,
  'seqNo' : instance.seqNo
};