// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_with_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionWithAnswer _$QuestionWithAnswerFromJson(Map<String, dynamic> json) {
  return _QuestionWithAnswer.fromJson(json);
}

/// @nodoc
mixin _$QuestionWithAnswer {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionWithAnswerCopyWith<QuestionWithAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionWithAnswerCopyWith<$Res> {
  factory $QuestionWithAnswerCopyWith(
          QuestionWithAnswer value, $Res Function(QuestionWithAnswer) then) =
      _$QuestionWithAnswerCopyWithImpl<$Res, QuestionWithAnswer>;
  @useResult
  $Res call({int id, String question, List<String> answers, String answer});
}

/// @nodoc
class _$QuestionWithAnswerCopyWithImpl<$Res, $Val extends QuestionWithAnswer>
    implements $QuestionWithAnswerCopyWith<$Res> {
  _$QuestionWithAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answers = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionWithAnswerCopyWith<$Res>
    implements $QuestionWithAnswerCopyWith<$Res> {
  factory _$$_QuestionWithAnswerCopyWith(_$_QuestionWithAnswer value,
          $Res Function(_$_QuestionWithAnswer) then) =
      __$$_QuestionWithAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String question, List<String> answers, String answer});
}

/// @nodoc
class __$$_QuestionWithAnswerCopyWithImpl<$Res>
    extends _$QuestionWithAnswerCopyWithImpl<$Res, _$_QuestionWithAnswer>
    implements _$$_QuestionWithAnswerCopyWith<$Res> {
  __$$_QuestionWithAnswerCopyWithImpl(
      _$_QuestionWithAnswer _value, $Res Function(_$_QuestionWithAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answers = null,
    Object? answer = null,
  }) {
    return _then(_$_QuestionWithAnswer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionWithAnswer implements _QuestionWithAnswer {
  const _$_QuestionWithAnswer(
      {required this.id,
      required this.question,
      required final List<String> answers,
      required this.answer})
      : _answers = answers;

  factory _$_QuestionWithAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionWithAnswerFromJson(json);

  @override
  final int id;
  @override
  final String question;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String answer;

  @override
  String toString() {
    return 'QuestionWithAnswer(id: $id, question: $question, answers: $answers, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionWithAnswer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question,
      const DeepCollectionEquality().hash(_answers), answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionWithAnswerCopyWith<_$_QuestionWithAnswer> get copyWith =>
      __$$_QuestionWithAnswerCopyWithImpl<_$_QuestionWithAnswer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionWithAnswerToJson(
      this,
    );
  }
}

abstract class _QuestionWithAnswer implements QuestionWithAnswer {
  const factory _QuestionWithAnswer(
      {required final int id,
      required final String question,
      required final List<String> answers,
      required final String answer}) = _$_QuestionWithAnswer;

  factory _QuestionWithAnswer.fromJson(Map<String, dynamic> json) =
      _$_QuestionWithAnswer.fromJson;

  @override
  int get id;
  @override
  String get question;
  @override
  List<String> get answers;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionWithAnswerCopyWith<_$_QuestionWithAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
