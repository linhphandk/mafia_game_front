///
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ProfilePictureFormat extends $pb.ProtobufEnum {
  static const ProfilePictureFormat jpg = ProfilePictureFormat._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'jpg');
  static const ProfilePictureFormat png = ProfilePictureFormat._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'png');
  static const ProfilePictureFormat webp = ProfilePictureFormat._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'webp');

  static const $core.List<ProfilePictureFormat> values = <ProfilePictureFormat> [
    jpg,
    png,
    webp,
  ];

  static final $core.Map<$core.int, ProfilePictureFormat> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProfilePictureFormat? valueOf($core.int value) => _byValue[value];

  const ProfilePictureFormat._($core.int v, $core.String n) : super(v, n);
}

