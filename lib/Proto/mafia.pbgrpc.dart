///
//  Generated code. Do not modify.
//  source: mafia.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'mafia.pb.dart' as $0;
export 'mafia.pb.dart';

class accountClient extends $grpc.Client {
  static final _$register =
      $grpc.ClientMethod<$0.UserData, $0.RegisterResponse>(
          '/account/register',
          ($0.UserData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterResponse.fromBuffer(value));
  static final _$uploadProfilePicture =
      $grpc.ClientMethod<$0.ProfilePicture, $0.ProfilePictureUrl>(
          '/account/uploadProfilePicture',
          ($0.ProfilePicture value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ProfilePictureUrl.fromBuffer(value));

  accountClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RegisterResponse> register($0.UserData request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProfilePictureUrl> uploadProfilePicture(
      $0.ProfilePicture request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uploadProfilePicture, request, options: options);
  }
}

abstract class accountServiceBase extends $grpc.Service {
  $core.String get $name => 'account';

  accountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserData, $0.RegisterResponse>(
        'register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserData.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProfilePicture, $0.ProfilePictureUrl>(
        'uploadProfilePicture',
        uploadProfilePicture_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProfilePicture.fromBuffer(value),
        ($0.ProfilePictureUrl value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterResponse> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserData> request) async {
    return register(call, await request);
  }

  $async.Future<$0.ProfilePictureUrl> uploadProfilePicture_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProfilePicture> request) async {
    return uploadProfilePicture(call, await request);
  }

  $async.Future<$0.RegisterResponse> register(
      $grpc.ServiceCall call, $0.UserData request);
  $async.Future<$0.ProfilePictureUrl> uploadProfilePicture(
      $grpc.ServiceCall call, $0.ProfilePicture request);
}
