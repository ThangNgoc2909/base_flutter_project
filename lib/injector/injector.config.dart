// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_project/base/base_mapper/firebase_storage_error_response_mapper.dart'
    as _i8;
import 'package:base_project/base/base_mapper/json_object_error_response_mapper.dart'
    as _i9;
import 'package:base_project/base/base_navigation/base_route_info_mapper.dart'
    as _i5;
import 'package:base_project/base/base_rest_api/auth_app_client.dart' as _i23;
import 'package:base_project/base/base_rest_api/none_auth_app_client.dart'
    as _i10;
import 'package:base_project/base/base_rest_api/refresh_token_api_client.dart'
    as _i20;
import 'package:base_project/common/common_cubit/common_cubit.dart' as _i7;
import 'package:base_project/dio_config/middlewares/access_token_interceptor.dart'
    as _i18;
import 'package:base_project/dio_config/middlewares/refresh_token_interceptor.dart'
    as _i22;
import 'package:base_project/features/authentication/data/repository/login_repository.dart'
    as _i16;
import 'package:base_project/features/authentication/data/service/auth_service.dart'
    as _i15;
import 'package:base_project/features/authentication/presentation/login/bloc/login_cubit.dart'
    as _i19;
import 'package:base_project/features/authentication/repository/login_repository_impl.dart'
    as _i17;
import 'package:base_project/injector/injector.dart' as _i24;
import 'package:base_project/my_app/data/service/app_service.dart' as _i21;
import 'package:base_project/my_app/presentation/cubit/app_cubit.dart' as _i3;
import 'package:base_project/navigation/app_navigation/app_navigation_impl.dart'
    as _i13;
import 'package:base_project/navigation/app_navigation/app_navigator.dart'
    as _i12;
import 'package:base_project/navigation/app_route_info/app_route_info_mapper.dart'
    as _i6;
import 'package:base_project/preferences/app_preferences.dart' as _i14;
import 'package:base_project/router/app_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.lazySingleton<_i3.AppCubit>(() => _i3.AppCubit());
    gh.singleton<_i4.AppRouter>(_i4.AppRouter());
    gh.lazySingleton<_i5.BaseRouteInfoMapper>(() => _i6.AppRouteInfoMapper());
    gh.factory<_i7.CommonCubit>(() => _i7.CommonCubit());
    gh.factory<_i8.FirebaseStorageErrorResponseMapper>(
        () => _i8.FirebaseStorageErrorResponseMapper());
    gh.factory<_i9.JsonObjectErrorResponseMapper>(
        () => _i9.JsonObjectErrorResponseMapper());
    gh.lazySingleton<_i10.NoneAuthAppServerApiClient>(
        () => _i10.NoneAuthAppServerApiClient());
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i12.AppNavigator>(() => _i13.AppNavigatorImpl(
          gh<_i4.AppRouter>(),
          gh<_i5.BaseRouteInfoMapper>(),
        ));
    gh.lazySingleton<_i14.AppPreferences>(
        () => _i14.AppPreferences(gh<_i11.SharedPreferences>()));
    gh.lazySingleton<_i15.AuthService>(
        () => _i15.AuthService(gh<_i10.NoneAuthAppServerApiClient>()));
    gh.factory<_i16.LoginRepository>(
        () => _i17.LoginRepositoryImpl(gh<_i15.AuthService>()));
    gh.factory<_i18.AccessTokenInterceptor>(
        () => _i18.AccessTokenInterceptor(gh<_i14.AppPreferences>()));
    gh.factory<_i19.LoginCubit>(
        () => _i19.LoginCubit(gh<_i16.LoginRepository>()));
    gh.lazySingleton<_i20.RefreshTokenApiClient>(
        () => _i20.RefreshTokenApiClient(gh<_i18.AccessTokenInterceptor>()));
    gh.lazySingleton<_i21.RefreshTokenApiService>(
        () => _i21.RefreshTokenApiService(gh<_i20.RefreshTokenApiClient>()));
    gh.factory<_i22.RefreshTokenInterceptor>(() => _i22.RefreshTokenInterceptor(
          gh<_i14.AppPreferences>(),
          gh<_i21.RefreshTokenApiService>(),
          gh<_i10.NoneAuthAppServerApiClient>(),
        ));
    gh.lazySingleton<_i23.AuthApiClient>(() => _i23.AuthApiClient(
          gh<_i18.AccessTokenInterceptor>(),
          gh<_i22.RefreshTokenInterceptor>(),
        ));
    return this;
  }
}

class _$ServiceModule extends _i24.ServiceModule {}
