import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';

abstract class BaseSuccessResponseMapper<I, O> {
  const BaseSuccessResponseMapper();

  factory BaseSuccessResponseMapper.fromType(SuccessResponseMapperType type) {
    switch (type) {
      case SuccessResponseMapperType.dataJsonObject:
        return DataJsonObjectResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.dataJsonArray:
        return DataJsonArrayResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.jsonObject:
        return JsonObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.jsonArray:
        return JsonArrayResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.recordsJsonArray:
        return RecordsJsonArrayResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.resultsJsonArray:
        return ResultsJsonArrayResponseMapper<I>()
            as BaseSuccessResponseMapper<I, O>;
    }
  }

  O map(dynamic response, Decoder<I>? decoder);
}
