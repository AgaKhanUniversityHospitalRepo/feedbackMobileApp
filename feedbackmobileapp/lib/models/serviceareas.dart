import 'package:json_annotation/json_annotation.dart';

part 'serviceareas.g.dart';

@JsonSerializable()

class ServiceAreas{
  String name;

  ServiceAreas({required this.name});
}


