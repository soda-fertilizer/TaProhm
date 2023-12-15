import 'package:collection/collection.dart';

enum MoneyRequest {
  Deposit,
  Withdrawal,
  Transfer,
  Buy,
  Referral,
  Receive,
}

enum UpdateBalanceOperation {
  plus,
  minus,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MoneyRequest):
      return MoneyRequest.values.deserialize(value) as T?;
    case (UpdateBalanceOperation):
      return UpdateBalanceOperation.values.deserialize(value) as T?;
    default:
      return null;
  }
}
