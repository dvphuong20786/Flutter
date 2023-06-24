
part of 'ac1a1_list.dart';


// Ac1a1_List _$ListAc1a1FromJson(Map<String, dynamic> json){
//   return Ac1a1_List(Ac1a1List: (json['Ac1a1List'] as List<Ac1a1>)
//     !.map((e) => null))
// }

Ac1a1_List _$ListAc1a1FromJson(Map<String, dynamic> json) {
  return Ac1a1_List(
    // Ac1a1List: (json['Ac1a1List'] as List<dynamic>?)
    //     ?.map((e) =>
    //       e == null ? null : Ac1a1.fromJon(e as Map<String,dynamic>))
    //     ?.toList(),
    Ac1a1List: (json['Ac1a1List'] as List<dynamic>?)
        !.map((e) => Ac1a1.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListAc1a1ToJson(Ac1a1_List instance) =>
      <String, dynamic>{
          'Ac1a1List': instance.Ac1a1List
      };