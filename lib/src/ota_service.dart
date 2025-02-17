// Created by alex@justprodev.com on 17.02.2025.

/// Service for fetching the remote ARB file.
///
/// Implement this class to fetch the ARB files from your server.
abstract class OtaService {
  /// Get the version of the remote ARB file for the given locale.
  ///
  /// This method should return the version of the ARB file that is currently on the server.
  Future<int> getArbVersion(String localeName);

  /// Get the content of the remote ARB file for the given locale.
  ///
  /// Note: `fl_ota_version` should equal to [getArbVersion] for the same locale
  Future<String> getArbContent(String localeName);
}
