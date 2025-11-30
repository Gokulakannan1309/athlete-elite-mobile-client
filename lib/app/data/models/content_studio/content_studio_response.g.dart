// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_studio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentStudioResponseImpl _$$ContentStudioResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentStudioResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: ContentStudioData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContentStudioResponseImplToJson(
        _$ContentStudioResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$ContentStudioDataImpl _$$ContentStudioDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentStudioDataImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => ContentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContentStudioDataImplToJson(
        _$ContentStudioDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
    };

_$ContentItemImpl _$$ContentItemImplFromJson(Map<String, dynamic> json) =>
    _$ContentItemImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
      uploadedMediaType: json['uploadedMediaType'] as String,
      uploadedMedia: (json['uploadedMedia'] as List<dynamic>)
          .map((e) => UploadedMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasEditedMedia: json['hasEditedMedia'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      editedAt: json['editedAt'] as String?,
    );

Map<String, dynamic> _$$ContentItemImplToJson(_$ContentItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'description': instance.description,
      'uploadedMediaType': instance.uploadedMediaType,
      'uploadedMedia': instance.uploadedMedia,
      'hasEditedMedia': instance.hasEditedMedia,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'editedAt': instance.editedAt,
    };

_$UploadedMediaImpl _$$UploadedMediaImplFromJson(Map<String, dynamic> json) =>
    _$UploadedMediaImpl(
      url: json['url'] as String,
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      mimeType: json['mimeType'] as String,
      mediaType: json['mediaType'] as String,
    );

Map<String, dynamic> _$$UploadedMediaImplToJson(_$UploadedMediaImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'fileSize': instance.fileSize,
      'mimeType': instance.mimeType,
      'mediaType': instance.mediaType,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };
