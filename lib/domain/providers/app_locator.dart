import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pro_tests/data/services/auth_service.dart';
import 'package:pro_tests/data/services/test_create_delete_service_impl.dart';
import 'package:pro_tests/data/services/test_get_passing_results_service_imp.dart';
import 'package:pro_tests/domain/models/test_with_question/test_with_questions.dart';
import 'package:pro_tests/domain/providers/auth_state.dart';
import 'package:pro_tests/domain/providers/service_locator.dart';
import 'package:pro_tests/domain/providers/test_creation.dart';
import 'package:pro_tests/domain/providers/test_list.dart';
import 'package:pro_tests/domain/providers/test_results.dart';
import 'package:pro_tests/domain/repository/authentication/auth_repository.dart';
import 'package:pro_tests/domain/repository/test_create_delete/test_create_delete_repository_impl.dart';
import 'package:pro_tests/domain/repository/test_get_passing_result/test_get_passing_result_repo_impl.dart';
import 'package:pro_tests/domain/repository/token_manager/token_manager.dart';
import 'package:pro_tests/ui/router/router.dart';
import 'package:pro_tests/ui/router/routes.dart';
import 'package:pro_tests/ui/states/authentication_state/authentication_state.dart';
import 'package:pro_tests/ui/states/test_list_state/test_list_stete.dart';
import 'package:pro_tests/ui/states/settings_state/settings_state.dart';
import 'package:pro_tests/ui/states/test_passing_state/test_passing_state.dart';
import 'package:pro_tests/ui/states/test_results_state/test_results_state.dart';
import 'package:sentry_dio/sentry_dio.dart';

import 'test_attempt.dart';

class AppLocator implements ServiceLocator {
  @override
  final dio = Dio();

  @override
  late final tokenManager = TokenManager(_initInterceptors, _removeInterceptors);

  @override
  late final StateProvider<SettingsState> settingsProvider;

  @override
  late final StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState> authenticationStateNotifier;

  @override
  late final StateNotifierProvider<TestAttemptStateNotifier, TestPassingState?> testAttemptStateNotifier;

  @override
  late final StateNotifierProvider<TestCreationStateNotifier, TestWithQuestion> testCreationStateNotifier;

  @override
  late final StateNotifierProvider<TestListStateNotifier, TestListState> testListStateNotifier;

  @override
  late final StateNotifierProvider<TestResultStateNotifier, TestResultState> testResultsStateNotifier;

  @override
  Future<void> init() async {
    final token = await tokenManager.readToken();
    final isTokenValid = tokenManager.isTokenValid(token);

    _initInterceptors(token);
    _initAuth(isTokenValid);
    _initTestManage();
    _initTestResults();
    _initSettings();

    dio.addSentry();
  }

  void _initSettings() {
    settingsProvider = StateProvider<SettingsState>((ref) {
      return SettingsState(ThemeMode.dark, AppLocalizations.supportedLocales[0]);
    });
  }

  void _initInterceptors(String? token) {
    if (token != null) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            options.headers['Authorization'] = 'Bearer $token';
            handler.next(options);
          },
        ),
      );
      dio.interceptors.add(_UnauthorizedInterceptor(tokenManager));
    }
  }

  void _removeInterceptors() {
    dio.interceptors.clear();
  }

  void _initAuth(bool isTokenValid) {
    final authService = AuthServiceImpl(dio);
    final authenticationRepository = AuthenticationRepositoryImpl(authService);
    authenticationStateNotifier = StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState>(
      (ref) => AuthenticationStateNotifier(authenticationRepository),
    );
  }

  void _initTestManage() {
    final testManageService = TestCreateDeleteServiceImpl(dio);
    final testManageRepository = TestCreateDeleteRepositoryImpl(testManageService);
    testCreationStateNotifier = StateNotifierProvider<TestCreationStateNotifier, TestWithQuestion>(
      (ref) {
        return TestCreationStateNotifier(repo: testManageRepository);
      },
    );
    testListStateNotifier = StateNotifierProvider<TestListStateNotifier, TestListState>(
      (ref) {
        return TestListStateNotifier(
          repo: testManageRepository,
        );
      },
    );
  }

  void _initTestResults() {
    final service = TestGetPassingResultsServiceImpl(dio);
    final repo = TestGetPassingResultRepoImpl(service);
    testResultsStateNotifier = StateNotifierProvider((ref) => TestResultStateNotifier(repo));
    testAttemptStateNotifier = StateNotifierProvider((ref) => TestAttemptStateNotifier(repo));
  }
}

class _UnauthorizedInterceptor extends Interceptor {
  final TokenManager tm;

  _UnauthorizedInterceptor(this.tm);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      tm.deleteToken();
      AppRouter.router.replaceNamed(AppRoutes.auth.name);
    }
    super.onError(err, handler);
  }
}
