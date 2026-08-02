import 'dart:ffi';

import 'package:kps_flutter_getx_design_battern/app/cores/models/post/PostResponse.dart';

import '../../../cores/models/post/Content.dart';

abstract class PostRepository {
  Future<List<Content>> getAllPost({Int? page, String? limit, String? status});
}