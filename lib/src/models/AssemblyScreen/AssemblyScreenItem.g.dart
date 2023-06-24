

part of 'AssemblyScreenItem.dart';


AssemblyScreenItem _$AssemblyScreenItemFromJson(Map<String, dynamic> json) => AssemblyScreenItem(
    Line: json['line'] as String,
    Process: json['process'] as String,
    Model: json['model'] as String,
    Body: json['body'] as String,
    SeqNo: json['seqNo'] as String,
    Grade: json['grade'] as String,
    LotNo: json['lotNo'] as String,
    NoInLot: json['noInLot'] as int,
    Color: json['color'] as String,
    WorkingDate: json['WorkingDate'] == null ? null : DateTime.parse(json['WorkingDate'] as String),
    NoInDate: json['noInDate'] as int,
    ProcessSeq: json['processSeq'] as int,
    Dolly: json['dolly'] as String,
    ModelName: json['modelName'] as String,
    Message: json['message'] as String,
    LotInOrder: json['lotInOrder'] as String,
    IsProject: json['isProject'] as String,
    IsTrd: json['isTrd'] as String,
    RowNo: json['rowNo'] as String
);

Map<String, dynamic> _$AssemblyScreenItemToJson(AssemblyScreenItem instance) =>
    <String, dynamic>{
      'Line': instance.Line,
      'Process': instance.Process,
      'Model': instance.Model,
      'Body': instance.Body,
      'SeqNo': instance.SeqNo,
      'Grade': instance.Grade,
      'LotNo': instance.LotNo,
      'NoInLot': instance.NoInLot,
      'Color': instance.Color,
      'WorkingDate': instance.WorkingDate,
      'NoInDate': instance.NoInDate,
      'ProcessSeq': instance.ProcessSeq,
      'Dolly': instance.Dolly,
      'ModelName': instance.ModelName,
      'Message': instance.Message,
      'LotInOrder': instance.LotInOrder,
      'IsProject': instance.IsProject,
      'IsTrd': instance.IsTrd,
      'RowNo': instance.RowNo
    };




