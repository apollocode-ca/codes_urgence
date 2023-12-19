import 'dart:convert';
import 'package:somum_utilities/somum_utilities.dart';
import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';

class CodeTypeModel extends Cloneable {
  final CodeType type;
  CodeTypeModel({
    required this.type,
  });

  CodeTypeModel copyWith({
    CodeType? type,
  }) {
    return CodeTypeModel(
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type.toMap()});

    return result;
  }

  factory CodeTypeModel.fromMap(Map<String, dynamic> map) {
    return CodeTypeModel(
      type: EnumHelper.enumFromMap(CodeType.values, map['type']) as CodeType,
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeTypeModel.fromJson(String source) =>
      CodeTypeModel.fromMap(json.decode(source));

  @override
  String toString() => 'CodeTypeModel(type: $type)';

  @override
  bool operator ==(Object? other) {
    if (identical(this, other)) return true;

    return other is CodeTypeModel && other.type == type;
  }

  @override
  int get hashCode => type.hashCode;

  @override
  CodeTypeModel clone() => CodeTypeModel(
        type: type,
      );
}
