// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetSectionModelCollection on Isar {
  IsarCollection<String, SectionModel> get sectionModels => this.collection();
}

const SectionModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'SectionModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'idFromBackend',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'projectId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'order',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, SectionModel>(
    serialize: serializeSectionModel,
    deserialize: deserializeSectionModel,
    deserializeProperty: deserializeSectionModelProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeSectionModel(IsarWriter writer, SectionModel object) {
  IsarCore.writeString(writer, 1, object.id);
  {
    final value = object.idFromBackend;
    if (value == null) {
      IsarCore.writeNull(writer, 2);
    } else {
      IsarCore.writeString(writer, 2, value);
    }
  }
  {
    final value = object.projectId;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  IsarCore.writeLong(writer, 4, object.order ?? -9223372036854775808);
  {
    final value = object.name;
    if (value == null) {
      IsarCore.writeNull(writer, 5);
    } else {
      IsarCore.writeString(writer, 5, value);
    }
  }
  return Isar.fastHash(object.id);
}

@isarProtected
SectionModel deserializeSectionModel(IsarReader reader) {
  final String _id;
  _id = IsarCore.readString(reader, 1) ?? '';
  final String? _idFromBackend;
  _idFromBackend = IsarCore.readString(reader, 2);
  final String? _projectId;
  _projectId = IsarCore.readString(reader, 3);
  final int? _order;
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      _order = null;
    } else {
      _order = value;
    }
  }
  final String? _name;
  _name = IsarCore.readString(reader, 5);
  final object = SectionModel(
    id: _id,
    idFromBackend: _idFromBackend,
    projectId: _projectId,
    order: _order,
    name: _name,
  );
  return object;
}

@isarProtected
dynamic deserializeSectionModelProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2);
    case 3:
      return IsarCore.readString(reader, 3);
    case 4:
      {
        final value = IsarCore.readLong(reader, 4);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    case 5:
      return IsarCore.readString(reader, 5);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _SectionModelUpdate {
  bool call({
    required String id,
    String? idFromBackend,
    String? projectId,
    int? order,
    String? name,
  });
}

class _SectionModelUpdateImpl implements _SectionModelUpdate {
  const _SectionModelUpdateImpl(this.collection);

  final IsarCollection<String, SectionModel> collection;

  @override
  bool call({
    required String id,
    Object? idFromBackend = ignore,
    Object? projectId = ignore,
    Object? order = ignore,
    Object? name = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (idFromBackend != ignore) 2: idFromBackend as String?,
          if (projectId != ignore) 3: projectId as String?,
          if (order != ignore) 4: order as int?,
          if (name != ignore) 5: name as String?,
        }) >
        0;
  }
}

sealed class _SectionModelUpdateAll {
  int call({
    required List<String> id,
    String? idFromBackend,
    String? projectId,
    int? order,
    String? name,
  });
}

class _SectionModelUpdateAllImpl implements _SectionModelUpdateAll {
  const _SectionModelUpdateAllImpl(this.collection);

  final IsarCollection<String, SectionModel> collection;

  @override
  int call({
    required List<String> id,
    Object? idFromBackend = ignore,
    Object? projectId = ignore,
    Object? order = ignore,
    Object? name = ignore,
  }) {
    return collection.updateProperties(id, {
      if (idFromBackend != ignore) 2: idFromBackend as String?,
      if (projectId != ignore) 3: projectId as String?,
      if (order != ignore) 4: order as int?,
      if (name != ignore) 5: name as String?,
    });
  }
}

extension SectionModelUpdate on IsarCollection<String, SectionModel> {
  _SectionModelUpdate get update => _SectionModelUpdateImpl(this);

  _SectionModelUpdateAll get updateAll => _SectionModelUpdateAllImpl(this);
}

sealed class _SectionModelQueryUpdate {
  int call({
    String? idFromBackend,
    String? projectId,
    int? order,
    String? name,
  });
}

class _SectionModelQueryUpdateImpl implements _SectionModelQueryUpdate {
  const _SectionModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<SectionModel> query;
  final int? limit;

  @override
  int call({
    Object? idFromBackend = ignore,
    Object? projectId = ignore,
    Object? order = ignore,
    Object? name = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (idFromBackend != ignore) 2: idFromBackend as String?,
      if (projectId != ignore) 3: projectId as String?,
      if (order != ignore) 4: order as int?,
      if (name != ignore) 5: name as String?,
    });
  }
}

extension SectionModelQueryUpdate on IsarQuery<SectionModel> {
  _SectionModelQueryUpdate get updateFirst =>
      _SectionModelQueryUpdateImpl(this, limit: 1);

  _SectionModelQueryUpdate get updateAll => _SectionModelQueryUpdateImpl(this);
}

class _SectionModelQueryBuilderUpdateImpl implements _SectionModelQueryUpdate {
  const _SectionModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<SectionModel, SectionModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? idFromBackend = ignore,
    Object? projectId = ignore,
    Object? order = ignore,
    Object? name = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (idFromBackend != ignore) 2: idFromBackend as String?,
        if (projectId != ignore) 3: projectId as String?,
        if (order != ignore) 4: order as int?,
        if (name != ignore) 5: name as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension SectionModelQueryBuilderUpdate
    on QueryBuilder<SectionModel, SectionModel, QOperations> {
  _SectionModelQueryUpdate get updateFirst =>
      _SectionModelQueryBuilderUpdateImpl(this, limit: 1);

  _SectionModelQueryUpdate get updateAll =>
      _SectionModelQueryBuilderUpdateImpl(this);
}

extension SectionModelQueryFilter
    on QueryBuilder<SectionModel, SectionModel, QFilterCondition> {
  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      idFromBackendIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      projectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      orderIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> orderEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      orderGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      orderGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> orderLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      orderLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> orderBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      nameLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }
}

extension SectionModelQueryObject
    on QueryBuilder<SectionModel, SectionModel, QFilterCondition> {}

extension SectionModelQuerySortBy
    on QueryBuilder<SectionModel, SectionModel, QSortBy> {
  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByIdFromBackend(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy>
      sortByIdFromBackendDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByProjectId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByProjectIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension SectionModelQuerySortThenBy
    on QueryBuilder<SectionModel, SectionModel, QSortThenBy> {
  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByIdFromBackend(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy>
      thenByIdFromBackendDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByProjectId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByProjectIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension SectionModelQueryWhereDistinct
    on QueryBuilder<SectionModel, SectionModel, QDistinct> {
  QueryBuilder<SectionModel, SectionModel, QAfterDistinct>
      distinctByIdFromBackend({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterDistinct> distinctByProjectId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<SectionModel, SectionModel, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }
}

extension SectionModelQueryProperty1
    on QueryBuilder<SectionModel, SectionModel, QProperty> {
  QueryBuilder<SectionModel, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<SectionModel, String?, QAfterProperty> idFromBackendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<SectionModel, String?, QAfterProperty> projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<SectionModel, int?, QAfterProperty> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<SectionModel, String?, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension SectionModelQueryProperty2<R>
    on QueryBuilder<SectionModel, R, QAfterProperty> {
  QueryBuilder<SectionModel, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<SectionModel, (R, String?), QAfterProperty>
      idFromBackendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<SectionModel, (R, String?), QAfterProperty> projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<SectionModel, (R, int?), QAfterProperty> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<SectionModel, (R, String?), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension SectionModelQueryProperty3<R1, R2>
    on QueryBuilder<SectionModel, (R1, R2), QAfterProperty> {
  QueryBuilder<SectionModel, (R1, R2, String), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<SectionModel, (R1, R2, String?), QOperations>
      idFromBackendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<SectionModel, (R1, R2, String?), QOperations>
      projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<SectionModel, (R1, R2, int?), QOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<SectionModel, (R1, R2, String?), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}
