// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_database.dart';

// ignore_for_file: type=lint
class $NewsCacheTable extends NewsCache
    with TableInfo<$NewsCacheTable, NewsCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _urlToImageMeta = const VerificationMeta(
    'urlToImage',
  );
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
    'url_to_image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
    'published_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSavedMeta = const VerificationMeta(
    'isSaved',
  );
  @override
  late final GeneratedColumn<bool> isSaved = GeneratedColumn<bool>(
    'is_saved',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_saved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    url,
    title,
    description,
    urlToImage,
    content,
    publishedAt,
    isSaved,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<NewsCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
        _urlToImageMeta,
        urlToImage.isAcceptableOrUnknown(
          data['url_to_image']!,
          _urlToImageMeta,
        ),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_saved')) {
      context.handle(
        _isSavedMeta,
        isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  NewsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsCacheData(
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      urlToImage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_to_image'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      ),
      isSaved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_saved'],
      )!,
    );
  }

  @override
  $NewsCacheTable createAlias(String alias) {
    return $NewsCacheTable(attachedDatabase, alias);
  }
}

class NewsCacheData extends DataClass implements Insertable<NewsCacheData> {
  final String url;
  final String title;
  final String description;
  final String urlToImage;
  final String content;
  final DateTime? publishedAt;
  final bool isSaved;
  const NewsCacheData({
    required this.url,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
    this.publishedAt,
    required this.isSaved,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['url'] = Variable<String>(url);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['url_to_image'] = Variable<String>(urlToImage);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    map['is_saved'] = Variable<bool>(isSaved);
    return map;
  }

  NewsCacheCompanion toCompanion(bool nullToAbsent) {
    return NewsCacheCompanion(
      url: Value(url),
      title: Value(title),
      description: Value(description),
      urlToImage: Value(urlToImage),
      content: Value(content),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      isSaved: Value(isSaved),
    );
  }

  factory NewsCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsCacheData(
      url: serializer.fromJson<String>(json['url']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      content: serializer.fromJson<String>(json['content']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      isSaved: serializer.fromJson<bool>(json['isSaved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'url': serializer.toJson<String>(url),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'content': serializer.toJson<String>(content),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'isSaved': serializer.toJson<bool>(isSaved),
    };
  }

  NewsCacheData copyWith({
    String? url,
    String? title,
    String? description,
    String? urlToImage,
    String? content,
    Value<DateTime?> publishedAt = const Value.absent(),
    bool? isSaved,
  }) => NewsCacheData(
    url: url ?? this.url,
    title: title ?? this.title,
    description: description ?? this.description,
    urlToImage: urlToImage ?? this.urlToImage,
    content: content ?? this.content,
    publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
    isSaved: isSaved ?? this.isSaved,
  );
  NewsCacheData copyWithCompanion(NewsCacheCompanion data) {
    return NewsCacheData(
      url: data.url.present ? data.url.value : this.url,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      urlToImage: data.urlToImage.present
          ? data.urlToImage.value
          : this.urlToImage,
      content: data.content.present ? data.content.value : this.content,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      isSaved: data.isSaved.present ? data.isSaved.value : this.isSaved,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NewsCacheData(')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('content: $content, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    url,
    title,
    description,
    urlToImage,
    content,
    publishedAt,
    isSaved,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsCacheData &&
          other.url == this.url &&
          other.title == this.title &&
          other.description == this.description &&
          other.urlToImage == this.urlToImage &&
          other.content == this.content &&
          other.publishedAt == this.publishedAt &&
          other.isSaved == this.isSaved);
}

class NewsCacheCompanion extends UpdateCompanion<NewsCacheData> {
  final Value<String> url;
  final Value<String> title;
  final Value<String> description;
  final Value<String> urlToImage;
  final Value<String> content;
  final Value<DateTime?> publishedAt;
  final Value<bool> isSaved;
  final Value<int> rowid;
  const NewsCacheCompanion({
    this.url = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.content = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsCacheCompanion.insert({
    required String url,
    required String title,
    this.description = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.content = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : url = Value(url),
       title = Value(title);
  static Insertable<NewsCacheData> custom({
    Expression<String>? url,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? urlToImage,
    Expression<String>? content,
    Expression<DateTime>? publishedAt,
    Expression<bool>? isSaved,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (content != null) 'content': content,
      if (publishedAt != null) 'published_at': publishedAt,
      if (isSaved != null) 'is_saved': isSaved,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsCacheCompanion copyWith({
    Value<String>? url,
    Value<String>? title,
    Value<String>? description,
    Value<String>? urlToImage,
    Value<String>? content,
    Value<DateTime?>? publishedAt,
    Value<bool>? isSaved,
    Value<int>? rowid,
  }) {
    return NewsCacheCompanion(
      url: url ?? this.url,
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      content: content ?? this.content,
      publishedAt: publishedAt ?? this.publishedAt,
      isSaved: isSaved ?? this.isSaved,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsCacheCompanion(')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('content: $content, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isSaved: $isSaved, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$NewsDatabase extends GeneratedDatabase {
  _$NewsDatabase(QueryExecutor e) : super(e);
  $NewsDatabaseManager get managers => $NewsDatabaseManager(this);
  late final $NewsCacheTable newsCache = $NewsCacheTable(this);
  late final NewsDao newsDao = NewsDao(this as NewsDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [newsCache];
}

typedef $$NewsCacheTableCreateCompanionBuilder =
    NewsCacheCompanion Function({
      required String url,
      required String title,
      Value<String> description,
      Value<String> urlToImage,
      Value<String> content,
      Value<DateTime?> publishedAt,
      Value<bool> isSaved,
      Value<int> rowid,
    });
typedef $$NewsCacheTableUpdateCompanionBuilder =
    NewsCacheCompanion Function({
      Value<String> url,
      Value<String> title,
      Value<String> description,
      Value<String> urlToImage,
      Value<String> content,
      Value<DateTime?> publishedAt,
      Value<bool> isSaved,
      Value<int> rowid,
    });

class $$NewsCacheTableFilterComposer
    extends Composer<_$NewsDatabase, $NewsCacheTable> {
  $$NewsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSaved => $composableBuilder(
    column: $table.isSaved,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NewsCacheTableOrderingComposer
    extends Composer<_$NewsDatabase, $NewsCacheTable> {
  $$NewsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSaved => $composableBuilder(
    column: $table.isSaved,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NewsCacheTableAnnotationComposer
    extends Composer<_$NewsDatabase, $NewsCacheTable> {
  $$NewsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSaved =>
      $composableBuilder(column: $table.isSaved, builder: (column) => column);
}

class $$NewsCacheTableTableManager
    extends
        RootTableManager<
          _$NewsDatabase,
          $NewsCacheTable,
          NewsCacheData,
          $$NewsCacheTableFilterComposer,
          $$NewsCacheTableOrderingComposer,
          $$NewsCacheTableAnnotationComposer,
          $$NewsCacheTableCreateCompanionBuilder,
          $$NewsCacheTableUpdateCompanionBuilder,
          (
            NewsCacheData,
            BaseReferences<_$NewsDatabase, $NewsCacheTable, NewsCacheData>,
          ),
          NewsCacheData,
          PrefetchHooks Function()
        > {
  $$NewsCacheTableTableManager(_$NewsDatabase db, $NewsCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> url = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> urlToImage = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<bool> isSaved = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NewsCacheCompanion(
                url: url,
                title: title,
                description: description,
                urlToImage: urlToImage,
                content: content,
                publishedAt: publishedAt,
                isSaved: isSaved,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String url,
                required String title,
                Value<String> description = const Value.absent(),
                Value<String> urlToImage = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<bool> isSaved = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NewsCacheCompanion.insert(
                url: url,
                title: title,
                description: description,
                urlToImage: urlToImage,
                content: content,
                publishedAt: publishedAt,
                isSaved: isSaved,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NewsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$NewsDatabase,
      $NewsCacheTable,
      NewsCacheData,
      $$NewsCacheTableFilterComposer,
      $$NewsCacheTableOrderingComposer,
      $$NewsCacheTableAnnotationComposer,
      $$NewsCacheTableCreateCompanionBuilder,
      $$NewsCacheTableUpdateCompanionBuilder,
      (
        NewsCacheData,
        BaseReferences<_$NewsDatabase, $NewsCacheTable, NewsCacheData>,
      ),
      NewsCacheData,
      PrefetchHooks Function()
    >;

class $NewsDatabaseManager {
  final _$NewsDatabase _db;
  $NewsDatabaseManager(this._db);
  $$NewsCacheTableTableManager get newsCache =>
      $$NewsCacheTableTableManager(_db, _db.newsCache);
}
