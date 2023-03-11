///
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account.pb.dart' as $0;
export 'account.pb.dart';

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
  static final _$checkEmail =
      $grpc.ClientMethod<$0.UserEmail, $0.CheckEmailResponse>(
          '/account/checkEmail',
          ($0.UserEmail value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CheckEmailResponse.fromBuffer(value));
  static final _$checkUsername =
      $grpc.ClientMethod<$0.Username, $0.CheckUsernameResponse>(
          '/account/checkUsername',
          ($0.Username value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CheckUsernameResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.UserLoginData, $0.LoginResponse>(
      '/account/login',
      ($0.UserLoginData value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$createSocialLogin =
      $grpc.ClientMethod<$0.SocialUserData, $0.LoginResponse>(
          '/account/createSocialLogin',
          ($0.SocialUserData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$socialLogin =
      $grpc.ClientMethod<$0.SocialLoginData, $0.LoginResponse>(
          '/account/socialLogin',
          ($0.SocialLoginData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.CheckEmailResponse> checkEmail($0.UserEmail request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheckUsernameResponse> checkUsername(
      $0.Username request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkUsername, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login($0.UserLoginData request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> createSocialLogin(
      $0.SocialUserData request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSocialLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> socialLogin($0.SocialLoginData request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$socialLogin, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.UserEmail, $0.CheckEmailResponse>(
        'checkEmail',
        checkEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserEmail.fromBuffer(value),
        ($0.CheckEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Username, $0.CheckUsernameResponse>(
        'checkUsername',
        checkUsername_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Username.fromBuffer(value),
        ($0.CheckUsernameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserLoginData, $0.LoginResponse>(
        'login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserLoginData.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SocialUserData, $0.LoginResponse>(
        'createSocialLogin',
        createSocialLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SocialUserData.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SocialLoginData, $0.LoginResponse>(
        'socialLogin',
        socialLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SocialLoginData.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterResponse> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserData> request) async {
    return register(call, await request);
  }

  $async.Future<$0.ProfilePictureUrl> uploadProfilePicture_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProfilePicture> request) async {
    return uploadProfilePicture(call, await request);
  }

  $async.Future<$0.CheckEmailResponse> checkEmail_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserEmail> request) async {
    return checkEmail(call, await request);
  }

  $async.Future<$0.CheckUsernameResponse> checkUsername_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Username> request) async {
    return checkUsername(call, await request);
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserLoginData> request) async {
    return login(call, await request);
  }

  $async.Future<$0.LoginResponse> createSocialLogin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SocialUserData> request) async {
    return createSocialLogin(call, await request);
  }

  $async.Future<$0.LoginResponse> socialLogin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SocialLoginData> request) async {
    return socialLogin(call, await request);
  }

  $async.Future<$0.RegisterResponse> register(
      $grpc.ServiceCall call, $0.UserData request);
  $async.Future<$0.ProfilePictureUrl> uploadProfilePicture(
      $grpc.ServiceCall call, $0.ProfilePicture request);
  $async.Future<$0.CheckEmailResponse> checkEmail(
      $grpc.ServiceCall call, $0.UserEmail request);
  $async.Future<$0.CheckUsernameResponse> checkUsername(
      $grpc.ServiceCall call, $0.Username request);
  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.UserLoginData request);
  $async.Future<$0.LoginResponse> createSocialLogin(
      $grpc.ServiceCall call, $0.SocialUserData request);
  $async.Future<$0.LoginResponse> socialLogin(
      $grpc.ServiceCall call, $0.SocialLoginData request);
}
