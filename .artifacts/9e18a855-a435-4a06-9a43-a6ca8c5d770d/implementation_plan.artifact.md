# Implementation Plan - Fix Code Issues

Resolve syntax errors, compiler warnings, and naming convention issues across the project.

## User Review Required

> [!IMPORTANT]
> I will be renaming files to follow the Dart `lower_case_with_underscores` convention (e.g., `RegisterRequest.dart` -> `register_request.dart`). This will affect all files in `lib/app/cores/models/auth/`.

## Proposed Changes

### [Cores]

#### [MODIFY] [api_network_service_impl.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/cores/network/api_network_service_impl.dart)
- Rename `httpClient` prefix to `http` to follow naming conventions.

#### [RENAME] `lib/app/cores/models/auth/RegisterRequest.dart` -> `register_request.dart`
#### [RENAME] `lib/app/cores/models/auth/RegisterResponse.dart` -> `register_response.dart`
#### [RENAME] `lib/app/cores/models/auth/LoginRequest.dart` -> `login_request.dart`
#### [RENAME] `lib/app/cores/models/auth/LoginResponse.dart` -> `login_response.dart`
#### [RENAME] `lib/app/cores/models/auth/User.dart` -> `user.dart`
#### [RENAME] `lib/app/cores/models/auth/Roles.dart` -> `roles.dart`

### [Auth Module]

#### [MODIFY] [auth_repository.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/module/auth/repository/auth_repository.dart)
- Add missing import for `RegisterRequest`.
- Update all model imports to use new filenames.

#### [MODIFY] [api_network_service.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/cores/network/api_network_service.dart)
- Update model imports to use new filenames.

#### [MODIFY] [api_network_service_impl.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/cores/network/api_network_service_impl.dart)
- Update model imports to use new filenames.
- Rename `httpClient` prefix to `http`.

#### [MODIFY] [auth_repository_impl.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/module/auth/repository/auth_repository_impl.dart)
- Update model imports to use new filenames.

#### [MODIFY] [register_controller.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/module/auth/register/register_controller.dart)
- Update model imports to use new filenames.

#### [MODIFY] [login_controller.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/module/auth/login/login_controller.dart)
- Update model imports to use new filenames.

### [App Configuration]

#### [MODIFY] [main.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/main.dart)
- Remove unnecessary `get_material_app.dart` import.

## Verification Plan

### Automated Tests
- Run `analyze_file` on all modified files to ensure no errors or warnings remain.
