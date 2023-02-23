///
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use profilePictureFormatDescriptor instead')
const ProfilePictureFormat$json = const {
  '1': 'ProfilePictureFormat',
  '2': const [
    const {'1': 'jpg', '2': 0},
    const {'1': 'png', '2': 1},
    const {'1': 'webp', '2': 2},
  ],
};

/// Descriptor for `ProfilePictureFormat`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List profilePictureFormatDescriptor = $convert.base64Decode('ChRQcm9maWxlUGljdHVyZUZvcm1hdBIHCgNqcGcQABIHCgNwbmcQARIICgR3ZWJwEAI=');
@$core.Deprecated('Use userDataDescriptor instead')
const UserData$json = const {
  '1': 'UserData',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profileImageName', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'profileImageName', '17': true},
  ],
  '8': const [
    const {'1': '_profileImageName'},
  ],
};

/// Descriptor for `UserData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDataDescriptor = $convert.base64Decode('CghVc2VyRGF0YRIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIvChBwcm9maWxlSW1hZ2VOYW1lGAQgASgJSABSEHByb2ZpbGVJbWFnZU5hbWWIAQFCEwoRX3Byb2ZpbGVJbWFnZU5hbWU=');
@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = const {
  '1': 'RegisterResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'accessToken', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refreshToken', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode('ChBSZWdpc3RlclJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZBIgCgthY2Nlc3NUb2tlbhgCIAEoCVILYWNjZXNzVG9rZW4SIgoMcmVmcmVzaFRva2VuGAMgASgJUgxyZWZyZXNoVG9rZW4=');
@$core.Deprecated('Use userLoginDataDescriptor instead')
const UserLoginData$json = const {
  '1': 'UserLoginData',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `UserLoginData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userLoginDataDescriptor = $convert.base64Decode('Cg1Vc2VyTG9naW5EYXRhEhQKBWVtYWlsGAEgASgJUgVlbWFpbBIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'profileImage', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'profileImage', '17': true},
    const {'1': 'accessToken', '3': 4, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refreshToken', '3': 5, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
  '8': const [
    const {'1': '_profileImage'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode('Cg1Mb2dpblJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZBIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbWUSJwoMcHJvZmlsZUltYWdlGAMgASgJSABSDHByb2ZpbGVJbWFnZYgBARIgCgthY2Nlc3NUb2tlbhgEIAEoCVILYWNjZXNzVG9rZW4SIgoMcmVmcmVzaFRva2VuGAUgASgJUgxyZWZyZXNoVG9rZW5CDwoNX3Byb2ZpbGVJbWFnZQ==');
@$core.Deprecated('Use profilePictureUrlDescriptor instead')
const ProfilePictureUrl$json = const {
  '1': 'ProfilePictureUrl',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `ProfilePictureUrl`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profilePictureUrlDescriptor = $convert.base64Decode('ChFQcm9maWxlUGljdHVyZVVybBIQCgN1cmwYASABKAlSA3VybA==');
@$core.Deprecated('Use fileDescriptor instead')
const File$json = const {
  '1': 'File',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode('CgRGaWxlEhgKB2NvbnRlbnQYASABKAxSB2NvbnRlbnQ=');
@$core.Deprecated('Use profilePictureDescriptor instead')
const ProfilePicture$json = const {
  '1': 'ProfilePicture',
  '2': const [
    const {'1': 'format', '3': 1, '4': 1, '5': 14, '6': '.ProfilePictureFormat', '10': 'format'},
    const {'1': 'profileImage', '3': 2, '4': 1, '5': 11, '6': '.File', '10': 'profileImage'},
  ],
};

/// Descriptor for `ProfilePicture`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profilePictureDescriptor = $convert.base64Decode('Cg5Qcm9maWxlUGljdHVyZRItCgZmb3JtYXQYASABKA4yFS5Qcm9maWxlUGljdHVyZUZvcm1hdFIGZm9ybWF0EikKDHByb2ZpbGVJbWFnZRgCIAEoCzIFLkZpbGVSDHByb2ZpbGVJbWFnZQ==');
@$core.Deprecated('Use userEmailDescriptor instead')
const UserEmail$json = const {
  '1': 'UserEmail',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `UserEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userEmailDescriptor = $convert.base64Decode('CglVc2VyRW1haWwSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use usernameDescriptor instead')
const Username$json = const {
  '1': 'Username',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `Username`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usernameDescriptor = $convert.base64Decode('CghVc2VybmFtZRIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWU=');
@$core.Deprecated('Use checkEmailResponseDescriptor instead')
const CheckEmailResponse$json = const {
  '1': 'CheckEmailResponse',
  '2': const [
    const {'1': 'exists', '3': 1, '4': 1, '5': 8, '10': 'exists'},
  ],
};

/// Descriptor for `CheckEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkEmailResponseDescriptor = $convert.base64Decode('ChJDaGVja0VtYWlsUmVzcG9uc2USFgoGZXhpc3RzGAEgASgIUgZleGlzdHM=');
@$core.Deprecated('Use checkUsernameResponseDescriptor instead')
const CheckUsernameResponse$json = const {
  '1': 'CheckUsernameResponse',
  '2': const [
    const {'1': 'exists', '3': 1, '4': 1, '5': 8, '10': 'exists'},
  ],
};

/// Descriptor for `CheckUsernameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUsernameResponseDescriptor = $convert.base64Decode('ChVDaGVja1VzZXJuYW1lUmVzcG9uc2USFgoGZXhpc3RzGAEgASgIUgZleGlzdHM=');
