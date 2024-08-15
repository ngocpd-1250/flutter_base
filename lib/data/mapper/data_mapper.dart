import 'package:base_flutter/data/model/data_model.dart';
import 'package:base_flutter/domain/entities/domain_entity.dart';

abstract class DataMapper<T extends DataModel, R extends DomainEntity> {
  R map(T? data);

  List<R> mapList(List<T> dataList) => dataList.map((e) => map(e)).toList();

  List<R>? mapNullableList(List<T>? dataList) =>
      dataList?.map((e) => map(e)).toList();
}
