// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteSongsTable extends FavoriteSongs
    with TableInfo<$FavoriteSongsTable, FavoriteSongEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<int> songId = GeneratedColumn<int>(
    'song_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [songId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_songs';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteSongEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('song_id')) {
      context.handle(
        _songIdMeta,
        songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {songId};
  @override
  FavoriteSongEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteSongEntity(
      songId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}song_id'],
      )!,
    );
  }

  @override
  $FavoriteSongsTable createAlias(String alias) {
    return $FavoriteSongsTable(attachedDatabase, alias);
  }
}

class FavoriteSongEntity extends DataClass
    implements Insertable<FavoriteSongEntity> {
  final int songId;
  const FavoriteSongEntity({required this.songId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['song_id'] = Variable<int>(songId);
    return map;
  }

  FavoriteSongsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteSongsCompanion(songId: Value(songId));
  }

  factory FavoriteSongEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteSongEntity(songId: serializer.fromJson<int>(json['songId']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'songId': serializer.toJson<int>(songId)};
  }

  FavoriteSongEntity copyWith({int? songId}) =>
      FavoriteSongEntity(songId: songId ?? this.songId);
  FavoriteSongEntity copyWithCompanion(FavoriteSongsCompanion data) {
    return FavoriteSongEntity(
      songId: data.songId.present ? data.songId.value : this.songId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteSongEntity(')
          ..write('songId: $songId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => songId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteSongEntity && other.songId == this.songId);
}

class FavoriteSongsCompanion extends UpdateCompanion<FavoriteSongEntity> {
  final Value<int> songId;
  const FavoriteSongsCompanion({this.songId = const Value.absent()});
  FavoriteSongsCompanion.insert({this.songId = const Value.absent()});
  static Insertable<FavoriteSongEntity> custom({Expression<int>? songId}) {
    return RawValuesInsertable({if (songId != null) 'song_id': songId});
  }

  FavoriteSongsCompanion copyWith({Value<int>? songId}) {
    return FavoriteSongsCompanion(songId: songId ?? this.songId);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteSongsCompanion(')
          ..write('songId: $songId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteSongsTable favoriteSongs = $FavoriteSongsTable(this);
  late final FavoriteSongDao favoriteSongDao = FavoriteSongDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteSongs];
}

typedef $$FavoriteSongsTableCreateCompanionBuilder =
    FavoriteSongsCompanion Function({Value<int> songId});
typedef $$FavoriteSongsTableUpdateCompanionBuilder =
    FavoriteSongsCompanion Function({Value<int> songId});

class $$FavoriteSongsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteSongsTable> {
  $$FavoriteSongsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get songId => $composableBuilder(
    column: $table.songId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteSongsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteSongsTable> {
  $$FavoriteSongsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get songId => $composableBuilder(
    column: $table.songId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteSongsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteSongsTable> {
  $$FavoriteSongsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get songId =>
      $composableBuilder(column: $table.songId, builder: (column) => column);
}

class $$FavoriteSongsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteSongsTable,
          FavoriteSongEntity,
          $$FavoriteSongsTableFilterComposer,
          $$FavoriteSongsTableOrderingComposer,
          $$FavoriteSongsTableAnnotationComposer,
          $$FavoriteSongsTableCreateCompanionBuilder,
          $$FavoriteSongsTableUpdateCompanionBuilder,
          (
            FavoriteSongEntity,
            BaseReferences<
              _$AppDatabase,
              $FavoriteSongsTable,
              FavoriteSongEntity
            >,
          ),
          FavoriteSongEntity,
          PrefetchHooks Function()
        > {
  $$FavoriteSongsTableTableManager(_$AppDatabase db, $FavoriteSongsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteSongsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteSongsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteSongsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> songId = const Value.absent(),
          }) => FavoriteSongsCompanion(songId: songId),
          createCompanionCallback: ({
            Value<int> songId = const Value.absent(),
          }) => FavoriteSongsCompanion.insert(songId: songId),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FavoriteSongsTable, FavoriteSongEntity>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $FavoriteSongsTable,
                    FavoriteSongEntity
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteSongsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteSongsTable,
      FavoriteSongEntity,
      $$FavoriteSongsTableFilterComposer,
      $$FavoriteSongsTableOrderingComposer,
      $$FavoriteSongsTableAnnotationComposer,
      $$FavoriteSongsTableCreateCompanionBuilder,
      $$FavoriteSongsTableUpdateCompanionBuilder,
      (
        FavoriteSongEntity,
        BaseReferences<_$AppDatabase, $FavoriteSongsTable, FavoriteSongEntity>,
      ),
      FavoriteSongEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteSongsTableTableManager get favoriteSongs =>
      $$FavoriteSongsTableTableManager(_db, _db.favoriteSongs);
}
