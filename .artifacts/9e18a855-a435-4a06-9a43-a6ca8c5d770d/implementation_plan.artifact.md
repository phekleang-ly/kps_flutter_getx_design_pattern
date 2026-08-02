# Implementation Plan - Fix Unauthorized Access and Retry Logic

This plan addresses the "Unauthorized" error encountered when navigating to `/posts` by fixing a bug in the token refresh and request retry logic within `ApiNetworkServiceImpl`.

## User Review Required

> [!IMPORTANT]
> I will also fix a syntax error in the `RefreshTokenRequest.dart` model (extra closing brace) to ensure the project builds correctly.

## Proposed Changes

### [Cores]

#### [MODIFY] [RefreshTokenRequest.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/cores/models/auth/RefreshTokenRequest.dart)
- Remove the redundant closing brace `}` in the constructor.

#### [MODIFY] [api_network_service_impl.dart](file:///D:/BBU_Lessons/Mobile_Programming/kps_flutter_getx_design_pattern/lib/app/cores/network/api_network_service_impl.dart)
- Fix the `get` method's retry block: change `if (response.statusCode == 200)` to `if (retryResponse.statusCode == 200)`.
- Use a local `headers` map inside each method to prevent cross-contamination of authorization tokens across different requests.
- Ensure `jsonEncode` explicitly calls `.toJson()` for consistency.

## Verification Plan

### Automated Tests
- Run `analyze_file` on `api_network_service_impl.dart` and `RefreshTokenRequest.dart`.

### Manual Verification
- The user should test the `/posts` navigation again. If the token is expired, the app should now successfully refresh it and display the posts instead of returning `null`.
