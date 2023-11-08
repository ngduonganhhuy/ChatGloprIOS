// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Welcome {
    /// I've got an account
    internal static let alreadyHaveAccount = L10n.tr("Localization", "welcome.alreadyHaveAccount", fallback: "I've got an account")
    /// Register
    internal static let register = L10n.tr("Localization", "welcome.register", fallback: "Register")
    /// Localization.strings
    ///   ChatAppGlopr
    /// 
    ///   Created by Huy Nguyễn Dương Anh on 06/11/2023.
    internal static let text = L10n.tr("Localization", "welcome.text", fallback: "Expand your social circle to enhance the enjoyment in your life.")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
