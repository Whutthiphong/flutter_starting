import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../network/api.dart';
import '../base_repository.dart';

@injectable
class ConfigRepository extends BaseRepository {
  final ApiProvider _api;

  ConfigRepository(this._api);
}
