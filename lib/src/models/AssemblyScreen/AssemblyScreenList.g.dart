

part of 'AssemblyScreenList.dart';

AssemblyScreenList _$AssemblyScreenListFromJson(Map<String, dynamic> json) => AssemblyScreenList(

  items: (json['items'] as List<dynamic>?)
      ?.map((e) => AssemblyScreenItem.fromJson(e as Map<String, dynamic>))
      .toList(),

);

Map<String, dynamic> _$AssemblyScreenListToJson(AssemblyScreenList instance) => <String, dynamic>{

  'applications': instance.items,
};
