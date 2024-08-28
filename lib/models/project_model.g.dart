// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetProjectCollection on Isar {
  IsarCollection<String, Project> get projects => this.collection();
}

const ProjectSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Project',
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
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'commentCount',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'order',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'color',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isShared',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'isFavorite',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'isInboxProject',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'isTeamInbox',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'viewStyle',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'url',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'parentId',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, Project>(
    serialize: serializeProject,
    deserialize: deserializeProject,
    deserializeProperty: deserializeProjectProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeProject(IsarWriter writer, Project object) {
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
    final value = object.name;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  IsarCore.writeLong(writer, 4, object.commentCount ?? -9223372036854775808);
  IsarCore.writeLong(writer, 5, object.order ?? -9223372036854775808);
  {
    final value = object.color;
    if (value == null) {
      IsarCore.writeNull(writer, 6);
    } else {
      IsarCore.writeString(writer, 6, value);
    }
  }
  {
    final value = object.isShared;
    if (value == null) {
      IsarCore.writeNull(writer, 7);
    } else {
      IsarCore.writeBool(writer, 7, value);
    }
  }
  {
    final value = object.isFavorite;
    if (value == null) {
      IsarCore.writeNull(writer, 8);
    } else {
      IsarCore.writeBool(writer, 8, value);
    }
  }
  {
    final value = object.isInboxProject;
    if (value == null) {
      IsarCore.writeNull(writer, 9);
    } else {
      IsarCore.writeBool(writer, 9, value);
    }
  }
  {
    final value = object.isTeamInbox;
    if (value == null) {
      IsarCore.writeNull(writer, 10);
    } else {
      IsarCore.writeBool(writer, 10, value);
    }
  }
  {
    final value = object.viewStyle;
    if (value == null) {
      IsarCore.writeNull(writer, 11);
    } else {
      IsarCore.writeString(writer, 11, value);
    }
  }
  {
    final value = object.url;
    if (value == null) {
      IsarCore.writeNull(writer, 12);
    } else {
      IsarCore.writeString(writer, 12, value);
    }
  }
  {
    final value = object.parentId;
    if (value == null) {
      IsarCore.writeNull(writer, 13);
    } else {
      IsarCore.writeString(writer, 13, value);
    }
  }
  return Isar.fastHash(object.id);
}

@isarProtected
Project deserializeProject(IsarReader reader) {
  final String _id;
  _id = IsarCore.readString(reader, 1) ?? '';
  final String? _idFromBackend;
  _idFromBackend = IsarCore.readString(reader, 2);
  final String? _name;
  _name = IsarCore.readString(reader, 3);
  final int? _commentCount;
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      _commentCount = null;
    } else {
      _commentCount = value;
    }
  }
  final int? _order;
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      _order = null;
    } else {
      _order = value;
    }
  }
  final String? _color;
  _color = IsarCore.readString(reader, 6);
  final bool? _isShared;
  {
    if (IsarCore.readNull(reader, 7)) {
      _isShared = null;
    } else {
      _isShared = IsarCore.readBool(reader, 7);
    }
  }
  final bool? _isFavorite;
  {
    if (IsarCore.readNull(reader, 8)) {
      _isFavorite = null;
    } else {
      _isFavorite = IsarCore.readBool(reader, 8);
    }
  }
  final bool? _isInboxProject;
  {
    if (IsarCore.readNull(reader, 9)) {
      _isInboxProject = null;
    } else {
      _isInboxProject = IsarCore.readBool(reader, 9);
    }
  }
  final bool? _isTeamInbox;
  {
    if (IsarCore.readNull(reader, 10)) {
      _isTeamInbox = null;
    } else {
      _isTeamInbox = IsarCore.readBool(reader, 10);
    }
  }
  final String? _viewStyle;
  _viewStyle = IsarCore.readString(reader, 11);
  final String? _url;
  _url = IsarCore.readString(reader, 12);
  final String? _parentId;
  _parentId = IsarCore.readString(reader, 13);
  final object = Project(
    id: _id,
    idFromBackend: _idFromBackend,
    name: _name,
    commentCount: _commentCount,
    order: _order,
    color: _color,
    isShared: _isShared,
    isFavorite: _isFavorite,
    isInboxProject: _isInboxProject,
    isTeamInbox: _isTeamInbox,
    viewStyle: _viewStyle,
    url: _url,
    parentId: _parentId,
  );
  return object;
}

@isarProtected
dynamic deserializeProjectProp(IsarReader reader, int property) {
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
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    case 6:
      return IsarCore.readString(reader, 6);
    case 7:
      {
        if (IsarCore.readNull(reader, 7)) {
          return null;
        } else {
          return IsarCore.readBool(reader, 7);
        }
      }
    case 8:
      {
        if (IsarCore.readNull(reader, 8)) {
          return null;
        } else {
          return IsarCore.readBool(reader, 8);
        }
      }
    case 9:
      {
        if (IsarCore.readNull(reader, 9)) {
          return null;
        } else {
          return IsarCore.readBool(reader, 9);
        }
      }
    case 10:
      {
        if (IsarCore.readNull(reader, 10)) {
          return null;
        } else {
          return IsarCore.readBool(reader, 10);
        }
      }
    case 11:
      return IsarCore.readString(reader, 11);
    case 12:
      return IsarCore.readString(reader, 12);
    case 13:
      return IsarCore.readString(reader, 13);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _ProjectUpdate {
  bool call({
    required String id,
    String? idFromBackend,
    String? name,
    int? commentCount,
    int? order,
    String? color,
    bool? isShared,
    bool? isFavorite,
    bool? isInboxProject,
    bool? isTeamInbox,
    String? viewStyle,
    String? url,
    String? parentId,
  });
}

class _ProjectUpdateImpl implements _ProjectUpdate {
  const _ProjectUpdateImpl(this.collection);

  final IsarCollection<String, Project> collection;

  @override
  bool call({
    required String id,
    Object? idFromBackend = ignore,
    Object? name = ignore,
    Object? commentCount = ignore,
    Object? order = ignore,
    Object? color = ignore,
    Object? isShared = ignore,
    Object? isFavorite = ignore,
    Object? isInboxProject = ignore,
    Object? isTeamInbox = ignore,
    Object? viewStyle = ignore,
    Object? url = ignore,
    Object? parentId = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (idFromBackend != ignore) 2: idFromBackend as String?,
          if (name != ignore) 3: name as String?,
          if (commentCount != ignore) 4: commentCount as int?,
          if (order != ignore) 5: order as int?,
          if (color != ignore) 6: color as String?,
          if (isShared != ignore) 7: isShared as bool?,
          if (isFavorite != ignore) 8: isFavorite as bool?,
          if (isInboxProject != ignore) 9: isInboxProject as bool?,
          if (isTeamInbox != ignore) 10: isTeamInbox as bool?,
          if (viewStyle != ignore) 11: viewStyle as String?,
          if (url != ignore) 12: url as String?,
          if (parentId != ignore) 13: parentId as String?,
        }) >
        0;
  }
}

sealed class _ProjectUpdateAll {
  int call({
    required List<String> id,
    String? idFromBackend,
    String? name,
    int? commentCount,
    int? order,
    String? color,
    bool? isShared,
    bool? isFavorite,
    bool? isInboxProject,
    bool? isTeamInbox,
    String? viewStyle,
    String? url,
    String? parentId,
  });
}

class _ProjectUpdateAllImpl implements _ProjectUpdateAll {
  const _ProjectUpdateAllImpl(this.collection);

  final IsarCollection<String, Project> collection;

  @override
  int call({
    required List<String> id,
    Object? idFromBackend = ignore,
    Object? name = ignore,
    Object? commentCount = ignore,
    Object? order = ignore,
    Object? color = ignore,
    Object? isShared = ignore,
    Object? isFavorite = ignore,
    Object? isInboxProject = ignore,
    Object? isTeamInbox = ignore,
    Object? viewStyle = ignore,
    Object? url = ignore,
    Object? parentId = ignore,
  }) {
    return collection.updateProperties(id, {
      if (idFromBackend != ignore) 2: idFromBackend as String?,
      if (name != ignore) 3: name as String?,
      if (commentCount != ignore) 4: commentCount as int?,
      if (order != ignore) 5: order as int?,
      if (color != ignore) 6: color as String?,
      if (isShared != ignore) 7: isShared as bool?,
      if (isFavorite != ignore) 8: isFavorite as bool?,
      if (isInboxProject != ignore) 9: isInboxProject as bool?,
      if (isTeamInbox != ignore) 10: isTeamInbox as bool?,
      if (viewStyle != ignore) 11: viewStyle as String?,
      if (url != ignore) 12: url as String?,
      if (parentId != ignore) 13: parentId as String?,
    });
  }
}

extension ProjectUpdate on IsarCollection<String, Project> {
  _ProjectUpdate get update => _ProjectUpdateImpl(this);

  _ProjectUpdateAll get updateAll => _ProjectUpdateAllImpl(this);
}

sealed class _ProjectQueryUpdate {
  int call({
    String? idFromBackend,
    String? name,
    int? commentCount,
    int? order,
    String? color,
    bool? isShared,
    bool? isFavorite,
    bool? isInboxProject,
    bool? isTeamInbox,
    String? viewStyle,
    String? url,
    String? parentId,
  });
}

class _ProjectQueryUpdateImpl implements _ProjectQueryUpdate {
  const _ProjectQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Project> query;
  final int? limit;

  @override
  int call({
    Object? idFromBackend = ignore,
    Object? name = ignore,
    Object? commentCount = ignore,
    Object? order = ignore,
    Object? color = ignore,
    Object? isShared = ignore,
    Object? isFavorite = ignore,
    Object? isInboxProject = ignore,
    Object? isTeamInbox = ignore,
    Object? viewStyle = ignore,
    Object? url = ignore,
    Object? parentId = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (idFromBackend != ignore) 2: idFromBackend as String?,
      if (name != ignore) 3: name as String?,
      if (commentCount != ignore) 4: commentCount as int?,
      if (order != ignore) 5: order as int?,
      if (color != ignore) 6: color as String?,
      if (isShared != ignore) 7: isShared as bool?,
      if (isFavorite != ignore) 8: isFavorite as bool?,
      if (isInboxProject != ignore) 9: isInboxProject as bool?,
      if (isTeamInbox != ignore) 10: isTeamInbox as bool?,
      if (viewStyle != ignore) 11: viewStyle as String?,
      if (url != ignore) 12: url as String?,
      if (parentId != ignore) 13: parentId as String?,
    });
  }
}

extension ProjectQueryUpdate on IsarQuery<Project> {
  _ProjectQueryUpdate get updateFirst =>
      _ProjectQueryUpdateImpl(this, limit: 1);

  _ProjectQueryUpdate get updateAll => _ProjectQueryUpdateImpl(this);
}

class _ProjectQueryBuilderUpdateImpl implements _ProjectQueryUpdate {
  const _ProjectQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Project, Project, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? idFromBackend = ignore,
    Object? name = ignore,
    Object? commentCount = ignore,
    Object? order = ignore,
    Object? color = ignore,
    Object? isShared = ignore,
    Object? isFavorite = ignore,
    Object? isInboxProject = ignore,
    Object? isTeamInbox = ignore,
    Object? viewStyle = ignore,
    Object? url = ignore,
    Object? parentId = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (idFromBackend != ignore) 2: idFromBackend as String?,
        if (name != ignore) 3: name as String?,
        if (commentCount != ignore) 4: commentCount as int?,
        if (order != ignore) 5: order as int?,
        if (color != ignore) 6: color as String?,
        if (isShared != ignore) 7: isShared as bool?,
        if (isFavorite != ignore) 8: isFavorite as bool?,
        if (isInboxProject != ignore) 9: isInboxProject as bool?,
        if (isTeamInbox != ignore) 10: isTeamInbox as bool?,
        if (viewStyle != ignore) 11: viewStyle as String?,
        if (url != ignore) 12: url as String?,
        if (parentId != ignore) 13: parentId as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension ProjectQueryBuilderUpdate
    on QueryBuilder<Project, Project, QOperations> {
  _ProjectQueryUpdate get updateFirst =>
      _ProjectQueryBuilderUpdateImpl(this, limit: 1);

  _ProjectQueryUpdate get updateAll => _ProjectQueryBuilderUpdateImpl(this);
}

extension ProjectQueryFilter
    on QueryBuilder<Project, Project, QFilterCondition> {
  QueryBuilder<Project, Project, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idGreaterThanOrEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idContains(String value,
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idMatches(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      idFromBackendIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition>
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

  QueryBuilder<Project, Project, QAfterFilterCondition>
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendLessThan(
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

  QueryBuilder<Project, Project, QAfterFilterCondition>
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendBetween(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendStartsWith(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendEndsWith(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendContains(
      String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendMatches(
      String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<Project, Project, QAfterFilterCondition> idFromBackendIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Project, Project, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameLessThanOrEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<Project, Project, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> commentCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      commentCountIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> commentCountEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> commentCountGreaterThan(
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

  QueryBuilder<Project, Project, QAfterFilterCondition>
      commentCountGreaterThanOrEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> commentCountLessThan(
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

  QueryBuilder<Project, Project, QAfterFilterCondition>
      commentCountLessThanOrEqualTo(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> commentCountBetween(
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

  QueryBuilder<Project, Project, QAfterFilterCondition> orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> orderIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> orderEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> orderGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      orderGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> orderLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> orderLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> orderBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      colorGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isSharedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isSharedIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isSharedEqualTo(
    bool? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isFavoriteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isFavoriteIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isFavoriteEqualTo(
    bool? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isInboxProjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 9));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      isInboxProjectIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 9));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isInboxProjectEqualTo(
    bool? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isTeamInboxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isTeamInboxIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 10));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> isTeamInboxEqualTo(
    bool? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 11));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 11));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      viewStyleGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      viewStyleLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 11,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 11,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 11,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> viewStyleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 11,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 12));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 12));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 12,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 12,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 12,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 12,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 12,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 13));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 13));
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      parentIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition>
      parentIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 13,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 13,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 13,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 13,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Project, Project, QAfterFilterCondition> parentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 13,
          value: '',
        ),
      );
    });
  }
}

extension ProjectQueryObject
    on QueryBuilder<Project, Project, QFilterCondition> {}

extension ProjectQuerySortBy on QueryBuilder<Project, Project, QSortBy> {
  QueryBuilder<Project, Project, QAfterSortBy> sortById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIdFromBackend(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIdFromBackendDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByCommentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByCommentCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByColorDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsShared() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsSharedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsInboxProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsInboxProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsTeamInbox() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByIsTeamInboxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByViewStyle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        11,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByViewStyleDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        11,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        12,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByUrlDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        12,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByParentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        13,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> sortByParentIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        13,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension ProjectQuerySortThenBy
    on QueryBuilder<Project, Project, QSortThenBy> {
  QueryBuilder<Project, Project, QAfterSortBy> thenById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIdFromBackend(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIdFromBackendDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByCommentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByCommentCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByColorDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsShared() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsSharedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsInboxProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsInboxProjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsTeamInbox() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByIsTeamInboxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByViewStyle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByViewStyleDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByUrlDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByParentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterSortBy> thenByParentIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(13, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension ProjectQueryWhereDistinct
    on QueryBuilder<Project, Project, QDistinct> {
  QueryBuilder<Project, Project, QAfterDistinct> distinctByIdFromBackend(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByCommentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByIsShared() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByIsInboxProject() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(9);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByIsTeamInbox() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(10);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByViewStyle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(11, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(12, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Project, Project, QAfterDistinct> distinctByParentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(13, caseSensitive: caseSensitive);
    });
  }
}

extension ProjectQueryProperty1 on QueryBuilder<Project, Project, QProperty> {
  QueryBuilder<Project, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Project, String?, QAfterProperty> idFromBackendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Project, String?, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Project, int?, QAfterProperty> commentCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Project, int?, QAfterProperty> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Project, String?, QAfterProperty> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Project, bool?, QAfterProperty> isSharedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Project, bool?, QAfterProperty> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Project, bool?, QAfterProperty> isInboxProjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Project, bool?, QAfterProperty> isTeamInboxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Project, String?, QAfterProperty> viewStyleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Project, String?, QAfterProperty> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<Project, String?, QAfterProperty> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }
}

extension ProjectQueryProperty2<R> on QueryBuilder<Project, R, QAfterProperty> {
  QueryBuilder<Project, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Project, (R, String?), QAfterProperty> idFromBackendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Project, (R, String?), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Project, (R, int?), QAfterProperty> commentCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Project, (R, int?), QAfterProperty> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Project, (R, String?), QAfterProperty> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Project, (R, bool?), QAfterProperty> isSharedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Project, (R, bool?), QAfterProperty> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Project, (R, bool?), QAfterProperty> isInboxProjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Project, (R, bool?), QAfterProperty> isTeamInboxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Project, (R, String?), QAfterProperty> viewStyleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Project, (R, String?), QAfterProperty> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<Project, (R, String?), QAfterProperty> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }
}

extension ProjectQueryProperty3<R1, R2>
    on QueryBuilder<Project, (R1, R2), QAfterProperty> {
  QueryBuilder<Project, (R1, R2, String), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Project, (R1, R2, String?), QOperations>
      idFromBackendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Project, (R1, R2, String?), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Project, (R1, R2, int?), QOperations> commentCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Project, (R1, R2, int?), QOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Project, (R1, R2, String?), QOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Project, (R1, R2, bool?), QOperations> isSharedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Project, (R1, R2, bool?), QOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Project, (R1, R2, bool?), QOperations> isInboxProjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Project, (R1, R2, bool?), QOperations> isTeamInboxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Project, (R1, R2, String?), QOperations> viewStyleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Project, (R1, R2, String?), QOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }

  QueryBuilder<Project, (R1, R2, String?), QOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(13);
    });
  }
}
