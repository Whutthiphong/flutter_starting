// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/api.dart' as _i3;
import '../core/respository/config/config_repository.dart' as _i4;
import '../one/bloc/one_bloc.dart' as _i5;
import '../sconde/bloc/seconde_bloc.dart' as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ApiProvider>(() => _i3.ApiProvider());
  gh.factory<_i4.ConfigRepository>(
      () => _i4.ConfigRepository(gh<_i3.ApiProvider>()));
  gh.factory<_i5.OneBloc>(() => _i5.OneBloc(gh<_i3.ApiProvider>()));
  gh.factory<_i6.SecondeBloc>(() => _i6.SecondeBloc());
  return getIt;
}
