import Foundation

public enum AppUserDefaults {}

extension AppUserDefaults {
  public enum Key: String, CaseIterable {
    case isAuthorized
    case currentUser
    case token
    case cllocation
    case distance
    case isUserFirstNameEmpty
  }
}

extension AppUserDefaults {
  public static func save(_ value: Any?, forKey key: Key) {
    if value is [Any] {
      UserDefaults.standard.setValue(value, forKey: key.rawValue)
    } else {
      UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    UserDefaults.standard.synchronize()
  }

  public static func saveCodable<T: Codable>(_ value: T?, forKey key: Key) {
    let data = try? JSONEncoder().encode(value)
    UserDefaults.standard.set(data, forKey: key.rawValue)
    UserDefaults.standard.synchronize()
  }

  public static func saveCodable<T: Codable>(_ value: [T], forKey key: Key) {
    let data = try? JSONEncoder().encode(value)
    UserDefaults.standard.set(data, forKey: key.rawValue)
    UserDefaults.standard.synchronize()
  }

  public static func value<T>(forKey key: Key) -> T? where T: Decodable {
    guard let encodedData = UserDefaults.standard.data(forKey: key.rawValue) else {
      return nil
    }
    return try? JSONDecoder().decode(T.self, from: encodedData)
  }

  public static func value<T>(forKey key: Key) -> [T] where T: Decodable {
    guard let encodedData = UserDefaults.standard.data(forKey: key.rawValue) else {
      return []
    }
    return (try? JSONDecoder().decode([T].self, from: encodedData)) ?? []
  }

  public static func removeValue(forKey key: Key) {
    UserDefaults.standard.removeObject(forKey: key.rawValue)
    UserDefaults.standard.synchronize()
  }

  public static func erase() {
    if let appDomain = Bundle.main.bundleIdentifier {
      UserDefaults.standard.removePersistentDomain(forName: appDomain)
      UserDefaults.standard.synchronize()
    }
  }
}
