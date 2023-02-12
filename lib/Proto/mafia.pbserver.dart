///
//  Generated code. Do not modify.
//  source: mafia.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'mafia.pb.dart' as $0;
import 'mafia.pbjson.dart';

export 'mafia.pb.dart';

abstract class accountServiceBase extends $pb.GeneratedService {
  $async.Future<$0.RegisterResponse> register($pb.ServerContext ctx, $0.UserData request);
  $async.Future<$0.ProfilePictureUrl> uploadProfilePicture($pb.ServerContext ctx, $0.ProfilePicture request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'register': return $0.UserData();
      case 'uploadProfilePicture': return $0.ProfilePicture();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'register': return this.register(ctx, request as $0.UserData);
      case 'uploadProfilePicture': return this.uploadProfilePicture(ctx, request as $0.ProfilePicture);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => accountServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => accountServiceBase$messageJson;
}

