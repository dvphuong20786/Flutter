import 'package:json_annotation/json_annotation.dart';

part 'AssemblyScreenItem.g.dart';

@JsonSerializable()
class AssemblyScreenItem {
  String Line = '';
  String Process = '';
  String Model = '';
  String Body = '';
  String SeqNo = '';
  String Grade = '';
  String LotNo = '';
  int NoInLot = 0;
  String Color = '';
  DateTime? WorkingDate;
  int NoInDate = 0;
  int ProcessSeq = 0;
  String Dolly = '';
  String ModelName = '';
  String Message = '';
  String LotInOrder = '';
  String IsProject = '';
  String IsTrd = '';
  String RowNo = '';

  AssemblyScreenItem(
      { required this.Line,
        required this.Process,
        required this.Model,
        required this.Body,
        required this.SeqNo,
        required this.Grade,
        required this.LotNo,
        required this.NoInLot,
        required this.Color,
        this.WorkingDate,
        required this.NoInDate,
        required this.ProcessSeq,
        required this.Dolly,
        required this.ModelName,
        required this.Message,
        required this.LotInOrder,
        required this.IsProject,
        required this.IsTrd,
        required this.RowNo, });

  factory AssemblyScreenItem.fromJson(Map<String, dynamic> json) => _$AssemblyScreenItemFromJson(json);

  Map<String, dynamic> toJson() => _$AssemblyScreenItemToJson(this);
}


