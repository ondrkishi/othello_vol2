// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'othello_game_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OthelloGameData {
// ゲームの盤面の状態
  OthelloBoardStatus get boardStatus =>
      throw _privateConstructorUsedError; // ゲームを続けられる状態かどうか
  bool get isGameContinued => throw _privateConstructorUsedError; // 現在のプレイヤー
  Player get player => throw _privateConstructorUsedError; // パスの状態
  PassStatus get passStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OthelloGameDataCopyWith<OthelloGameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OthelloGameDataCopyWith<$Res> {
  factory $OthelloGameDataCopyWith(
          OthelloGameData value, $Res Function(OthelloGameData) then) =
      _$OthelloGameDataCopyWithImpl<$Res, OthelloGameData>;
  @useResult
  $Res call(
      {OthelloBoardStatus boardStatus,
      bool isGameContinued,
      Player player,
      PassStatus passStatus});

  $OthelloBoardStatusCopyWith<$Res> get boardStatus;
  $PassStatusCopyWith<$Res> get passStatus;
}

/// @nodoc
class _$OthelloGameDataCopyWithImpl<$Res, $Val extends OthelloGameData>
    implements $OthelloGameDataCopyWith<$Res> {
  _$OthelloGameDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardStatus = null,
    Object? isGameContinued = null,
    Object? player = null,
    Object? passStatus = null,
  }) {
    return _then(_value.copyWith(
      boardStatus: null == boardStatus
          ? _value.boardStatus
          : boardStatus // ignore: cast_nullable_to_non_nullable
              as OthelloBoardStatus,
      isGameContinued: null == isGameContinued
          ? _value.isGameContinued
          : isGameContinued // ignore: cast_nullable_to_non_nullable
              as bool,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      passStatus: null == passStatus
          ? _value.passStatus
          : passStatus // ignore: cast_nullable_to_non_nullable
              as PassStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OthelloBoardStatusCopyWith<$Res> get boardStatus {
    return $OthelloBoardStatusCopyWith<$Res>(_value.boardStatus, (value) {
      return _then(_value.copyWith(boardStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PassStatusCopyWith<$Res> get passStatus {
    return $PassStatusCopyWith<$Res>(_value.passStatus, (value) {
      return _then(_value.copyWith(passStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OthelloGameDataCopyWith<$Res>
    implements $OthelloGameDataCopyWith<$Res> {
  factory _$$_OthelloGameDataCopyWith(
          _$_OthelloGameData value, $Res Function(_$_OthelloGameData) then) =
      __$$_OthelloGameDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OthelloBoardStatus boardStatus,
      bool isGameContinued,
      Player player,
      PassStatus passStatus});

  @override
  $OthelloBoardStatusCopyWith<$Res> get boardStatus;
  @override
  $PassStatusCopyWith<$Res> get passStatus;
}

/// @nodoc
class __$$_OthelloGameDataCopyWithImpl<$Res>
    extends _$OthelloGameDataCopyWithImpl<$Res, _$_OthelloGameData>
    implements _$$_OthelloGameDataCopyWith<$Res> {
  __$$_OthelloGameDataCopyWithImpl(
      _$_OthelloGameData _value, $Res Function(_$_OthelloGameData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardStatus = null,
    Object? isGameContinued = null,
    Object? player = null,
    Object? passStatus = null,
  }) {
    return _then(_$_OthelloGameData(
      boardStatus: null == boardStatus
          ? _value.boardStatus
          : boardStatus // ignore: cast_nullable_to_non_nullable
              as OthelloBoardStatus,
      isGameContinued: null == isGameContinued
          ? _value.isGameContinued
          : isGameContinued // ignore: cast_nullable_to_non_nullable
              as bool,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      passStatus: null == passStatus
          ? _value.passStatus
          : passStatus // ignore: cast_nullable_to_non_nullable
              as PassStatus,
    ));
  }
}

/// @nodoc

class _$_OthelloGameData
    with DiagnosticableTreeMixin
    implements _OthelloGameData {
  const _$_OthelloGameData(
      {this.boardStatus = const OthelloBoardStatus(),
      this.isGameContinued = false,
      this.player = Player.none,
      this.passStatus = const PassStatus()});

// ゲームの盤面の状態
  @override
  @JsonKey()
  final OthelloBoardStatus boardStatus;
// ゲームを続けられる状態かどうか
  @override
  @JsonKey()
  final bool isGameContinued;
// 現在のプレイヤー
  @override
  @JsonKey()
  final Player player;
// パスの状態
  @override
  @JsonKey()
  final PassStatus passStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OthelloGameData(boardStatus: $boardStatus, isGameContinued: $isGameContinued, player: $player, passStatus: $passStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OthelloGameData'))
      ..add(DiagnosticsProperty('boardStatus', boardStatus))
      ..add(DiagnosticsProperty('isGameContinued', isGameContinued))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('passStatus', passStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OthelloGameData &&
            (identical(other.boardStatus, boardStatus) ||
                other.boardStatus == boardStatus) &&
            (identical(other.isGameContinued, isGameContinued) ||
                other.isGameContinued == isGameContinued) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.passStatus, passStatus) ||
                other.passStatus == passStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, boardStatus, isGameContinued, player, passStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OthelloGameDataCopyWith<_$_OthelloGameData> get copyWith =>
      __$$_OthelloGameDataCopyWithImpl<_$_OthelloGameData>(this, _$identity);
}

abstract class _OthelloGameData implements OthelloGameData {
  const factory _OthelloGameData(
      {final OthelloBoardStatus boardStatus,
      final bool isGameContinued,
      final Player player,
      final PassStatus passStatus}) = _$_OthelloGameData;

  @override // ゲームの盤面の状態
  OthelloBoardStatus get boardStatus;
  @override // ゲームを続けられる状態かどうか
  bool get isGameContinued;
  @override // 現在のプレイヤー
  Player get player;
  @override // パスの状態
  PassStatus get passStatus;
  @override
  @JsonKey(ignore: true)
  _$$_OthelloGameDataCopyWith<_$_OthelloGameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OthelloBoardStatus {
// 黒石の数
  int get blackCellCount => throw _privateConstructorUsedError; // 白石の数
  int get whiteCellCount => throw _privateConstructorUsedError; // 各セルの状態
  List<List<CellState>> get cellsStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OthelloBoardStatusCopyWith<OthelloBoardStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OthelloBoardStatusCopyWith<$Res> {
  factory $OthelloBoardStatusCopyWith(
          OthelloBoardStatus value, $Res Function(OthelloBoardStatus) then) =
      _$OthelloBoardStatusCopyWithImpl<$Res, OthelloBoardStatus>;
  @useResult
  $Res call(
      {int blackCellCount,
      int whiteCellCount,
      List<List<CellState>> cellsStatus});
}

/// @nodoc
class _$OthelloBoardStatusCopyWithImpl<$Res, $Val extends OthelloBoardStatus>
    implements $OthelloBoardStatusCopyWith<$Res> {
  _$OthelloBoardStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blackCellCount = null,
    Object? whiteCellCount = null,
    Object? cellsStatus = null,
  }) {
    return _then(_value.copyWith(
      blackCellCount: null == blackCellCount
          ? _value.blackCellCount
          : blackCellCount // ignore: cast_nullable_to_non_nullable
              as int,
      whiteCellCount: null == whiteCellCount
          ? _value.whiteCellCount
          : whiteCellCount // ignore: cast_nullable_to_non_nullable
              as int,
      cellsStatus: null == cellsStatus
          ? _value.cellsStatus
          : cellsStatus // ignore: cast_nullable_to_non_nullable
              as List<List<CellState>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OthelloBoardStatusCopyWith<$Res>
    implements $OthelloBoardStatusCopyWith<$Res> {
  factory _$$_OthelloBoardStatusCopyWith(_$_OthelloBoardStatus value,
          $Res Function(_$_OthelloBoardStatus) then) =
      __$$_OthelloBoardStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int blackCellCount,
      int whiteCellCount,
      List<List<CellState>> cellsStatus});
}

/// @nodoc
class __$$_OthelloBoardStatusCopyWithImpl<$Res>
    extends _$OthelloBoardStatusCopyWithImpl<$Res, _$_OthelloBoardStatus>
    implements _$$_OthelloBoardStatusCopyWith<$Res> {
  __$$_OthelloBoardStatusCopyWithImpl(
      _$_OthelloBoardStatus _value, $Res Function(_$_OthelloBoardStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blackCellCount = null,
    Object? whiteCellCount = null,
    Object? cellsStatus = null,
  }) {
    return _then(_$_OthelloBoardStatus(
      blackCellCount: null == blackCellCount
          ? _value.blackCellCount
          : blackCellCount // ignore: cast_nullable_to_non_nullable
              as int,
      whiteCellCount: null == whiteCellCount
          ? _value.whiteCellCount
          : whiteCellCount // ignore: cast_nullable_to_non_nullable
              as int,
      cellsStatus: null == cellsStatus
          ? _value._cellsStatus
          : cellsStatus // ignore: cast_nullable_to_non_nullable
              as List<List<CellState>>,
    ));
  }
}

/// @nodoc

class _$_OthelloBoardStatus
    with DiagnosticableTreeMixin
    implements _OthelloBoardStatus {
  const _$_OthelloBoardStatus(
      {this.blackCellCount = 0,
      this.whiteCellCount = 0,
      final List<List<CellState>> cellsStatus = const [[]]})
      : _cellsStatus = cellsStatus;

// 黒石の数
  @override
  @JsonKey()
  final int blackCellCount;
// 白石の数
  @override
  @JsonKey()
  final int whiteCellCount;
// 各セルの状態
  final List<List<CellState>> _cellsStatus;
// 各セルの状態
  @override
  @JsonKey()
  List<List<CellState>> get cellsStatus {
    if (_cellsStatus is EqualUnmodifiableListView) return _cellsStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cellsStatus);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OthelloBoardStatus(blackCellCount: $blackCellCount, whiteCellCount: $whiteCellCount, cellsStatus: $cellsStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OthelloBoardStatus'))
      ..add(DiagnosticsProperty('blackCellCount', blackCellCount))
      ..add(DiagnosticsProperty('whiteCellCount', whiteCellCount))
      ..add(DiagnosticsProperty('cellsStatus', cellsStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OthelloBoardStatus &&
            (identical(other.blackCellCount, blackCellCount) ||
                other.blackCellCount == blackCellCount) &&
            (identical(other.whiteCellCount, whiteCellCount) ||
                other.whiteCellCount == whiteCellCount) &&
            const DeepCollectionEquality()
                .equals(other._cellsStatus, _cellsStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blackCellCount, whiteCellCount,
      const DeepCollectionEquality().hash(_cellsStatus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OthelloBoardStatusCopyWith<_$_OthelloBoardStatus> get copyWith =>
      __$$_OthelloBoardStatusCopyWithImpl<_$_OthelloBoardStatus>(
          this, _$identity);
}

abstract class _OthelloBoardStatus implements OthelloBoardStatus {
  const factory _OthelloBoardStatus(
      {final int blackCellCount,
      final int whiteCellCount,
      final List<List<CellState>> cellsStatus}) = _$_OthelloBoardStatus;

  @override // 黒石の数
  int get blackCellCount;
  @override // 白石の数
  int get whiteCellCount;
  @override // 各セルの状態
  List<List<CellState>> get cellsStatus;
  @override
  @JsonKey(ignore: true)
  _$$_OthelloBoardStatusCopyWith<_$_OthelloBoardStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PassStatus {
// 黒石のプレイヤーのパス回数
  int get blackPassCount => throw _privateConstructorUsedError; // 白石のプレイヤーのパス回数
  int get whitePassCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PassStatusCopyWith<PassStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassStatusCopyWith<$Res> {
  factory $PassStatusCopyWith(
          PassStatus value, $Res Function(PassStatus) then) =
      _$PassStatusCopyWithImpl<$Res, PassStatus>;
  @useResult
  $Res call({int blackPassCount, int whitePassCount});
}

/// @nodoc
class _$PassStatusCopyWithImpl<$Res, $Val extends PassStatus>
    implements $PassStatusCopyWith<$Res> {
  _$PassStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blackPassCount = null,
    Object? whitePassCount = null,
  }) {
    return _then(_value.copyWith(
      blackPassCount: null == blackPassCount
          ? _value.blackPassCount
          : blackPassCount // ignore: cast_nullable_to_non_nullable
              as int,
      whitePassCount: null == whitePassCount
          ? _value.whitePassCount
          : whitePassCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassStatusCopyWith<$Res>
    implements $PassStatusCopyWith<$Res> {
  factory _$$_PassStatusCopyWith(
          _$_PassStatus value, $Res Function(_$_PassStatus) then) =
      __$$_PassStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int blackPassCount, int whitePassCount});
}

/// @nodoc
class __$$_PassStatusCopyWithImpl<$Res>
    extends _$PassStatusCopyWithImpl<$Res, _$_PassStatus>
    implements _$$_PassStatusCopyWith<$Res> {
  __$$_PassStatusCopyWithImpl(
      _$_PassStatus _value, $Res Function(_$_PassStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blackPassCount = null,
    Object? whitePassCount = null,
  }) {
    return _then(_$_PassStatus(
      blackPassCount: null == blackPassCount
          ? _value.blackPassCount
          : blackPassCount // ignore: cast_nullable_to_non_nullable
              as int,
      whitePassCount: null == whitePassCount
          ? _value.whitePassCount
          : whitePassCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PassStatus with DiagnosticableTreeMixin implements _PassStatus {
  const _$_PassStatus({this.blackPassCount = 0, this.whitePassCount = 0});

// 黒石のプレイヤーのパス回数
  @override
  @JsonKey()
  final int blackPassCount;
// 白石のプレイヤーのパス回数
  @override
  @JsonKey()
  final int whitePassCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PassStatus(blackPassCount: $blackPassCount, whitePassCount: $whitePassCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PassStatus'))
      ..add(DiagnosticsProperty('blackPassCount', blackPassCount))
      ..add(DiagnosticsProperty('whitePassCount', whitePassCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassStatus &&
            (identical(other.blackPassCount, blackPassCount) ||
                other.blackPassCount == blackPassCount) &&
            (identical(other.whitePassCount, whitePassCount) ||
                other.whitePassCount == whitePassCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blackPassCount, whitePassCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassStatusCopyWith<_$_PassStatus> get copyWith =>
      __$$_PassStatusCopyWithImpl<_$_PassStatus>(this, _$identity);
}

abstract class _PassStatus implements PassStatus {
  const factory _PassStatus(
      {final int blackPassCount, final int whitePassCount}) = _$_PassStatus;

  @override // 黒石のプレイヤーのパス回数
  int get blackPassCount;
  @override // 白石のプレイヤーのパス回数
  int get whitePassCount;
  @override
  @JsonKey(ignore: true)
  _$$_PassStatusCopyWith<_$_PassStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
