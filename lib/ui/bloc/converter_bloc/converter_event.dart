part of 'converter_bloc.dart';

@immutable
abstract class ConverterEvent {}

class ConverterLoadPref extends ConverterEvent {}

class SwitchCards extends ConverterEvent {}

class ChangeFormField extends ConverterEvent {
  final int indexTextFormField;
  final String value;

  ChangeFormField({
    required this.indexTextFormField,
    required this.value,
  });
}

class SetCardId extends ConverterEvent {
  final int cardIndex;
  final int id;

  SetCardId({required this.cardIndex, required this.id});
}

class SetRates extends ConverterEvent {
  final int cardIndex;
  final double rate;

  SetRates({required this.cardIndex, required this.rate});
}
