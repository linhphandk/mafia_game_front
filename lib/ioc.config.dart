// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'Services/user_service.dart' as _i3;
import 'Views/Registration/controller.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt init(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.UserService>(() => _i3.UserService());
  gh.factory<_RegistrationState>(() => _RegistrationState());
  gh.factory<_i4.RegistrationController>(
      () => _i4.RegistrationController(get<_i3.UserService>()));
  return get;
}
